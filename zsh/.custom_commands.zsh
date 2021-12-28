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

function vacations() {
  python3.10 -c "from datetime import datetime ; print((datetime.strptime('2021-12-31', '%Y-%m-%d').date() - datetime.today().date()).days)"
}

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
