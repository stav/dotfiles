# .bash_functions: executed by .bash_profile
# Functions allow for more complex script

# Re-source bash files

function sbp ()
{
	# seealso:: reload from bash_it
	# TODO: check if in venv and deactivate/activate
	deactivate
	source ~/.bash/.bash_profile
}

SW_HEADER_PRIVATE='';
SW_HEADER_PUBLIC='
  PUBLIC HANDLES:                 \n
  ---------------                 \n
  sp3 - Scrapy with Python 3      \n
';
SW_HEADER_ENVS='
  ENVIRONMENTS: \n
  ------------- \n
';
SW_MAPPED=false;

# Environment Selection

# TODO: function that sets-up the virtualenv from a config
function sw ()
{
	case "$1" in
		sp3)
			workon 'scrapy-py3';
			cd "$HOME/Work/Scrapy";
			rm -rfv build project.egg-info *.jl
			rm -rfv build project.egg-info *.jl *.csv
			rmpyc
			;;
		help)
			echo 'No help for the wicked.';
			;;
		*)
			[ -r ~/.bash_functions_private ] && source ~/.bash_functions_private;

			if [ "$SW_MAPPED" = false ]; then # Nothing in private
				if [ -z "$1" ]; then # No arguments
					echo
					echo -e $SW_HEADER_PUBLIC;
					echo -e $SW_HEADER_PRIVATE;
					echo -e $SW_HEADER_ENVS;
					workon;
				else
					echo "No mapping for $1";
				fi
			fi
			;;
	esac
}

# Repeat a character: `repeat - 10`

function repeat ()
{
	# printf "{$1}%.0s" {1..{$2}}
    # seq  -f "$1" -s '' $2; echo
    yes $1 | head -$2 | paste -s -d '' -
}

# Git rebase head [ num-prev-commits ]

function git_rebase_head ()
{
	git rebase -i HEAD~$1
}

# Git dashboard with status and stuff

function git_dash ()
{
	yes '' | sed 9q;  # print blank lines
	repeat . 100
	gb
	repeat . 100
	gs
	repeat . 100
	gl
}
