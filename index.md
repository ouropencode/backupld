---
layout: default
title: Home
---
# Welcome!

{{site.github.repository_name}}


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
