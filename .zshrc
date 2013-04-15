# .zshrc
# Current author: David Majnemer
# Original author: Saleem Abdulrasool <compnerd@compnerd.org>
# vim:set nowrap:

case `uname -s` in
	Darwin)
		export LHOSTNAME=`scutil --get LocalHostName`
	;;
	*)
		export LHOSTNAME=${HOST}
	;;
esac

autoload compinit; compinit -d "${HOME}/.zsh/.zcompdump-${LHOSTNAME}"

autoload age
autoload zmv

if [ ${ZSH_VERSION//.} -gt 420 ] ; then
	autoload -U url-quote-magic
	zle -N self-insert url-quote-magic
fi

autoload -U edit-command-line
zle -N edit-command-line

# Keep track of other people accessing the box
watch=( all )
export LOGCHECK=30
export WATCHFMT=$'\e[00;00m\e[01;36m'" -- %n@%m has %(a.logged in.logged out) --"$'\e[00;00m'

# directory hashes
if [ -d "${HOME}/sandbox" ] ; then
	hash -d sandbox="${HOME}/sandbox"
fi

if [ -d "${HOME}/work" ] ; then
	hash -d work="${HOME}/work"

	for dir in "${HOME}"/work/*(N-/) ; do
		hash -d $(basename "${dir}")="${dir}"
	done
fi

# common shell utils
if [ -d "${HOME}/.commonsh" ] ; then
	for file in "${HOME}"/.commonsh/*(N.x:t) ; do
		. "${HOME}/.commonsh/${file}"
	done
fi

# extras
if [ -d "${HOME}/.zsh" ] ; then
	for file in "${HOME}"/.zsh/*(N.x:t) ; do
		. "${HOME}/.zsh/${file}"
	done
fi

export PATH="${HOME}/opt/play-2.1.0:${PATH}"
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:${HOME}/opt/bin:${HOME}/opt/android/tools:${HOME}/opt/android/platform-tools
export PATH=$PATH:$HOME/opt/charm/bin
export PATH=/usr/local/Cellar/mercurial/2.3.1/bin:$PATH
export PATH=/usr/local/Cellar/qt/4.8.3/bin:$PATH
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export PATH="/usr/local/Cellar/gnu-tar/1.26/bin:/usr/local/sbin:${PATH}"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export TGM_AWS_ACCESS_KEY_ID=`cat ${HOME}/opt/etc/tgm_aws_access_key_id`
export TGM_AWS_SECRET_ACCESS_KEY=`cat ${HOME}/opt/etc/tgm_aws_secret_access_key`

export DERPOKER_AWS_ACCESS_KEY_ID=`cat ${HOME}/opt/etc/derpoker_aws_access_key_id`
export DERPOKER_AWS_SECRET_ACCESS_KEY=`cat ${HOME}/opt/etc/derpoker_aws_secret_access_key`
export DERPOKER_AWS_STORAGE_BUCKET_NAME=takeapokeatme_static
export DERPOKER_ADMIN_EMAIL="klnusbaum@gmail.com"

alias cantor_connect="ssh cantor"
alias taub_connect="ssh taub"
alias fb="days_till.py 2013 7 1 \"I start at Facebook!\""
alias eu="days_till.py 2013 5 28 \"I go to Europe!\""
alias gl="days_till.py 2015 7 1 \"I should call Grace!\""


function git(){hub "$@"}
. $HOME/sandbox/z/z.sh

clear; figlet -c  "This  terminal  is  FABULOUS !!!"  | toilet -F gay -f term
