" A function that automatically installs plugs if new ones are added.
function! s:install_as_needed() 
	let l:install_file = stdpath('data') . '/installed.txt'
	let l:need_refresh = 0
	let l:plugin_repos = keys(g:plugs)
	let l:previously_installed = readfile(l:install_file)
	for l:repo in l:plugin_repos
		if index(l:previously_installed, l:repo) == -1
			echom ('Added Plug ' . l:repo)
			call writefile([l:repo], l:install_file, "a")
			let l:need_refresh = 1
		endif
	endfor
	if l:need_refresh
		PlugInstall
	endif
endfunction


" A function that automatically deletes plugs if they are no longer used.
function! s:uninstall_as_needed() 
	let l:install_file = stdpath('data') . '/installed.txt'
	let l:need_clean = 0
	let l:plugin_repos = keys(g:plugs)
	let l:previously_installed = readfile(l:install_file)
	let l:still_valid_repos = []
	for l:old_repo in l:previously_installed
		if index(l:plugin_repos, l:old_repo) == -1
			" Notify that an invalid plugin was found
			echom ('Removing Plug ' . l:old_repo)
			" Mark that things need to be cleaned up later
			let l:need_clean = 1
		else
			" Add to a list of currently valid plugins
			call add(l:still_valid_repos, l:old_repo)
		endif
	endfor
	if l:need_clean
		" Delete unused plugins
		PlugClean!
		" Update plugin list with list of all new plugs
		call writefile(l:still_valid_repos, l:install_file, "s")
	endif
endfunction

" A function that automatically installs/deletes plugs based on if they are
" referenced above.
function! plugautoinstall#manage() 
	call s:install_as_needed()
	call s:uninstall_as_needed()
endfunction

