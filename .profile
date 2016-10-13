# MacPorts Installer addition on 2016-09-13_at_09:23:32: adding an appropriate PATH variable for use with MacPorts.

NPM_PREFIX=`npm config get prefix`
export PATH="/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin/:$NPM_PREFIX/bin:~/Development/cyhy-main/cyhy-oneoffs:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
