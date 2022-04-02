mkcd() {
    mkdir $1 && cd $1
}

fnr() {
    find $1 -type f | xargs -I{} sed -i "s/$2/$3/g" {}
}

find_empty_dirs() {
    find . -depth -type d -empty
}

uuid4() {
    python3 -c 'import uuid; print(uuid.uuid4())'
}
