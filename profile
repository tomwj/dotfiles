export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
# Force everything to use wayland
export GDK_BACKEND=wayland
export CLUTTER_BACKEND=wayland


# This is Windoze stuff to try and get SSH working nicely
# SSH_ENV="$HOME/.ssh/environment"
# 
# function start_agent {
#     echo "Initialising new SSH agent..."
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo succeeded
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add;
# }
# 
# # Source SSH settings, if applicable
# 
# if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     #ps ${SSH_AGENT_PID} doesn't work under cywgin
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
# else
#     start_agent;
# fi

# vim: set filetype=sh :
