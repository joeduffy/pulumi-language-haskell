set -e

compile() {
    echo "    - compile: include=$1, proto=$2, out=$3"
    stack exec -- \
        /nix/store/bapl3ldkcamaw4whkdks2bhzr5pbhh0r-ghc-8.10.3-with-packages/bin/compile-proto-file \
        --includeDir $1 \
        --proto $2 \
        --out $3
}

fix_module_name() {
    echo "    - fix: module=$1"
    # Fix the declarations of the module.
    sed -i.bak "s/module $1/module Pulumi\.Proto\.$1/g" ./lib/Pulumi/Proto/*.hs
    # Fix the imports of the module.
    sed -i.bak "s/import qualified $1/import qualified Pulumi\.Proto\.$1/g" ./lib/Pulumi/Proto/*.hs
    # Fix the references to members of the module.
    for d in $(grep -e '^newtype\|^data \([A-Za-z]*\)' lib/Pulumi/Proto/$1.hs | cut -d ' ' -f 2); do
        sed -i.bak "s/$1\.$d/Pulumi\.Proto\.$1\.$d/g" ./lib/Pulumi/Proto/*.hs
    done
}

if [[ -z "$PULUMI_PROTO_PATH" ]]; then
    >&2 echo "error: please set PULUMI_PROTO_PATH to the sdk/proto directory in the Pulumi repo"
    exit -1
fi

# Compile the Pulumi protos.
echo "Compiling Pulumi protos..."
for f in $(ls ${PULUMI_PROTO_PATH}/*.proto); do
    compile ${PULUMI_PROTO_PATH} $(basename $f) ./lib/Pulumi/Proto/
done

# HACK: Compile the Google protos -- we need to vendor these.
echo "Compiling Google protos..."
compile ${PULUMI_PROTO_PATH}/google/protobuf empty.proto ./lib/Pulumi/Proto/
compile ${PULUMI_PROTO_PATH}/google/protobuf struct.proto ./lib/Pulumi/Proto/
sed -i.bak 's/Google\.Protobuf\./Pulumi\.Proto\./g' ./lib/Pulumi/Proto/*.hs

# HACK: Fix up module names so they use qualified Pulumi.Proto names (and also not Google ones).
echo "Fixing proto module names..."
for f in $(ls ./lib/Pulumi/Proto/*.hs); do
    bf=$(basename $f)
    fix_module_name ${bf%.*}
done
# HACKHACK: Even worse, we can end up with double substitutions... ugh.
sed -i.bak 's/Pulumi\.Proto\.Pulumi\.Proto\./Pulumi\.Proto\./g' ./lib/Pulumi/Proto/*.hs
rm ./lib/Pulumi/Proto/*.hs.bak

echo "DONE."
