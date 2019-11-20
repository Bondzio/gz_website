deploy:
	git checkout gh-pages
	git rm -rf .
	git checkout jekyll -- _site
	git mv _site/* .	
	rmdir _site
	git push
	git checkout jekyll
