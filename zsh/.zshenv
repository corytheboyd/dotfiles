# Add rbenv to path and initialize on shell start
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#
# Prefer local binaries over system
export PATH=/usr/local/bin:$PATH
