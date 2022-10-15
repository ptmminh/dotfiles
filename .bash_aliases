###############
# SYSTEM      #
###############
fortune | cowsay -n | lolcat
# get live weather forecasts
# input: city
weather () { curl wttr.in/"$1"; }
alias cow_fortune="fortune | cowsay | lolcat"

alias rm='trash-put'
alias column="column -t -s,"
alias diff="diff --color=always -u"
alias ssh="ssh -XY"
# alias tar="tar -xf"
alias rsync="rsync -aizvh --no-whole-file --stats --progress"
alias less="less -r"
alias ncal="ncal -3w"
alias jq="jq -C"
alias findpwd='find $(pwd) -maxdepth 1 -name'
alias emacs="emacs -nw"
alias tm="tmux a -t main"
alias new_tm="tmux new -s main"
alias speedtest="speedtest --secure"

#############
# WORK      #
#############

alias project_path='export PYTHONPATH=$PYTHONPATH:$(pwd)'
alias pyclean='find . -type f -name "*.py[co]" -delete; find . -type d -name "__pycache__" -delete'
alias cppwd='pwd | xclip'
alias linestolist='paste -sd "," -'
# pytest extra CLIs
export ptv="-rxXsv"
alias isort='isort --profile black --line-length 120'

# data analysis (text-based)
alias csv_read="perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' | column -t -s,"
alias scsv_read="column -t -s ';'"
alias header_csv="tr ',' '\n' | tr -d ' ' | awk '{print NR,\$0}'"
alias header_scsv="tr ';' '\n' | tr -d ' ' | awk '{print NR,\$0}'"
# function to output specific column number
awk_col () { awk -F, '{ print $'"$1"' }'; }

# git
alias gitlog='git log --oneline --graph'
alias fetch_master='git fetch origin master:master'
export GIT_EDITOR=vim
export EDITOR=vim

# Cloud

# Downloading CLIs from Azure cloud storage
# AZ usage: az_dl_dir --destination . --pattern events/*
alias az_dl_dir="az storage blob download-batch --account-key ${AZURE_STORAGE_ACCOUNT_KEY} --source data --account-name ${AZURE_STORAGE_ACCOUNT_NAME}"
alias az_ul_dir="az storage blob upload-batch --account-key ${AZURE_STORAGE_ACCOUNT_KEY} --destination data --account-name ${AZURE_STORAGE_ACCOUNT_NAME}"

# alias for kubectl commands
alias k='kubectl'
alias kcur='kubectl config current-context'
# grep all contexts and grep the keyword and set current-context to be this value
kuse () { 
    matched_context=$(kubectl config get-contexts -o name | grep $1)
    kubectl config use-context $matched_context
}
