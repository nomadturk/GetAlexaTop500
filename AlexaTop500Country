<?php

function ob_file_callback($buffer)
{
	global $ob_file;
	fwrite($ob_file, $buffer);
}

# Define your country code here.
$countrycode = "TR";
$ob_file = fopen('AlexaTop500-' . $countrycode . '.txt', 'w');

for ($i = 0; $i < 20; $i++)
{
	$page = new DOMDocument;
	libxml_use_internal_errors(true);
	$page->loadHTMLFile('http://www.alexa.com/topsites/countries;' . $i . '/' . $countrycode);
	libxml_clear_errors();
	$divs = $page->getElementsByTagName('div');
	for ($pos = 0; $pos < $divs->length; $pos++)
	{
		$div = $divs->item($pos);
		$isSiteInfoDiv = $div->hasAttribute('class') && 'desc-container' === $div->getAttribute('class');
		if (false === $isSiteInfoDiv)
		{
			continue;
		}

		list($site) = sscanf($div->getElementsByTagName('a')->item(0)->getAttribute('href') , '/siteinfo/%s');
		ob_start('ob_file_callback');
		echo $site, PHP_EOL;
		ob_end_flush();
		PHP_EOL;
	}
}
