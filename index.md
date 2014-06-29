---
layout: default
title: Home
---
<p class="message">
  Hey there! This page is included as an example. Feel free to customize it for your own use upon downloading. Carry on!
</p>

<span id="release_version"></span>

<script type="text/javascript">
function showOnPage() {
	console.log(window['release_version']);
	var rel = document.getElementById("release_version");
	rel.innerHTML = window['release_version'];

	var download = document.getElementById("download_tgz");
	download.href += window['release_version'] + '.tar.gz';
}
function printRepoCount() {
	var responseObj = JSON.parse(this.responseText);
	window['release_version'] = responseObj[0].tag_name;
	showOnPage();
}
function getInfo() {
	var request = new XMLHttpRequest();
	request.onload = printRepoCount;
	request.open('get', 'https://api.github.com/repos/joeasaurus/backupld/releases', true)
	request.send()
}
window.onload = getInfo;
</script>

In the novel, *The Strange Case of Dr. Jeykll and Mr. Hyde*, Mr. Poole is Dr. Jekyll's virtuous and loyal butler. Similarly, Poole is an upstanding and effective butler that helps you build Jekyll themes. It's made by [@mdo](https://twitter.com/mdo).

There are currently two themes built on Poole:

* [Hyde](http://hyde.getpoole.com)
* [Lanyon](http://lanyon.getpoole.com)

Learn more and contribute on [GitHub](https://github.com/poole).

## Setup

Some fun facts about the setup of this project include:

* Built for [Jekyll](http://jekyllrb.com)
* Developed on GitHub and hosted for free on [GitHub Pages](https://pages.github.com)
* Coded with [Sublime Text 2](http://sublimetext.org), an amazing code editor
* Designed and developed while listening to music like [Blood Bros Trilogy](https://soundcloud.com/maddecent/sets/blood-bros-series)

Have questions or suggestions? Feel free to [open an issue on GitHub](https://github.com/poole/issues/new) or [ask me on Twitter](https://twitter.com/mdo).

Thanks for reading!
