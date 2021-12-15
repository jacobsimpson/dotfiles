#! /bin/bash

root=$HOME/bin/jdt-language-server-1.5.0/

if [[ ! -e $root ]]; then
    echo "The JDT language server is not installed. Installing..."
    # A JDT snapshot: https://download.eclipse.org/jdtls/snapshots/?d
    language_server_file=jdt-language-server-1.5.0-202109201721.tar.gz
    download_file=$HOME/Downloads/$language_server_file
    curl https://download.eclipse.org/jdtls/snapshots/$language_server_file \
        -o $download_file
    mkdir -p $root
    tar -zxvf $download_file -C $root
fi

# An absolute path to your data directory. eclipse.jdt.ls stores workspace specific information in
# it. I was setting a data directory equal to the root of the project, however I started getting this
# error in the neovim LSP logs:
#    Project identity location matches workspace root
data_dir=$HOME/projects

if ! ls $root/plugins/org.eclipse.equinox.launcher_*.jar >& /dev/null ; then
    echo "Unable to find a launcher at $root/plugins/org.eclipse.equinox.launcher_*.jar"
    exit 1
fi

exec java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -Dlog.level=ALL \
    -noverify \
    -Xmx1G \
    -jar $root/plugins/org.eclipse.equinox.launcher_*.jar \
    -configuration $root/config_mac \
    -data $data_dir \
    --add-modules=ALL-SYSTEM \
    --add-opens java.base/java.util=ALL-UNNAMED \
    --add-opesn java.base/java.lang=ALL-UNNAMED
