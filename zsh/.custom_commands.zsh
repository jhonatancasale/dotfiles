#!/usr/bin/env zsh

gitpush () {
  for THIS_REMOTE in $(git remote --verbose | awk '{print $1}' | sort -ru)
    do git push --set-upstream ${THIS_REMOTE} $(git rev-parse --abbrev-ref HEAD)
  done
}

function dorflex() {
  source ${PROJECTS}/dorflex/.env
  ${WORKSPACE}/virtualenvs/projects/dorflex/dorflex/bin/python ${PROJECTS}/dorflex/dorflex.py $1
}


function tinit() {
    tmux new-session -d -s "gp" -c "${HOME}"
    tmux new-session -d -s "pythonic" -c "${PROGRAMMING_LANGUAGES}/python"
    tmux new-session -d -s "rustic" -c "${PROGRAMMING_LANGUAGES}/rust"
    tmux new-session -d -s "wiki" -c "${WIKIHOME}"

    tmux attach -t gp
}

# function vacations() {
#     _data=$(curl -s -X 'GET' 'http://localhost:8000/vacations' -H 'accept: application/json')
#     if [ $? -ne 0 ]; then
#         echo "Undefined²"
#     else
#         # _date=$(curl -s -X 'GET' 'http://localhost:8000/vacations' -H 'accept: application/json' | python3.10 -c "import sys, json; data = json.load(sys.stdin)['data']; print(data['from'] if len(data) else 'Undefined')")
#         _date=$(echo "${_data}" | python3.10 -c "import sys, json; data = json.load(sys.stdin)['data']; print(data['from'] if len(data) else 'Undefined')")
#         if [ ${_date} = "Undefined" ]; then
#             echo ${_date}
#         else
#             python3.10 -c "from datetime import datetime ; print((datetime.strptime('2021-12-31', '%Y-%m-%d').date() - datetime.today().date()).days)"
#         fi
#     fi
# }

function solange() {
  ssh ${SOLANGE_CONN_STRING}
}

function source_virtualenv_python() {
  __dir_name=$(pwd | rev | cut -d/ -f1 | rev)
  __folders_count=$(find ${WORKSPACE}/virtualenvs -type d -name ${__dir_name} | wc -l)
  if [[ "${__folders_count}" == 1 ]]
  then
    __virtualenv_dir=$(find ${WORKSPACE}/virtualenvs -type d -name ${__dir_name})
    source "${__virtualenv_dir}/bin/activate"
  else
    echo "Didn't found this virtualenv ${__dir_name}"
  fi
}

function create_python_virtualenv() {
  python3.10 -m venv $1

  source $1/bin/activate
  pip install neovim black flake8 yapf pylint mypy
}

function rust() {
    project_name=$1

    cat > Cargo.toml << EOT
[package]
name = "${project_name}" # the name of the package
version = "0.0.1"    # the current version, obeying semver

[[bin]]
name = "${project_name}"
path = "src/${project_name}.rs"
EOT

    mkdir -p src
    touch src/${project_name}.rs
    tree
}

function update () {
    _current_path=${PWD}

    echo "[Update SO]"
    # sudo apt-get update -y && sudo apt-get upgrade -y
    yay -Syu
    echo ""

    echo "[Update Rust]"
    rustup update
    echo ""

    # echo "[Update zsh]"
    # cd ${ZSH}/themes
    # diff nanotech-jc.zsh-theme nanotech.zsh-theme
    # echo ""

    echo "[Update npm modules]"
    sudo npm update -g

    # echo "Attempting to call npm audit fix"
    # cd /tmp
    # npm i --package-lock-only
    # npm audit fix
    # echo ""

    cd ${_current_path} >/dev/null

    # echo "[Update OMZ]"
    # omz update
}

function commit () {
    gcmsg $1
    push
    cd - 2>/dev/null
}
