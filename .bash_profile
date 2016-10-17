# Load .profile, containing login, non-bash related initializations.
if [ -a ~/.profile ]
  then
    source ~/.profile
fi

# Load .bashrc, containing non-login related bash initializations.
if [ -a ~/.bashrc ]
  then
    source ~/.bashrc
fi
