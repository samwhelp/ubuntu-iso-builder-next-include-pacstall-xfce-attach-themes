

################################################################################
### Head: Master / Util / Apt
##

util_apt_source_list_create_simple () {

	local package_repo_url="${1}"
	local build_suite="${2}"

cat << __EOF__
deb ${package_repo_url} ${build_suite} main restricted universe multiverse
deb ${package_repo_url} ${build_suite}-updates main restricted universe multiverse
deb ${package_repo_url} ${build_suite}-backports main restricted universe multiverse
deb ${package_repo_url} ${build_suite}-security main restricted universe multiverse
__EOF__

}


##
### Tail: Master / Util / Apt
################################################################################
