#!/bin/sh

# auto-changelog
#git add CHANGELOG.md

printf '<link href="assets/styling.css" rel="stylesheet" />' > "doc-assets/changelog.html"
echo >> "doc-assets/changelog.html"
npx marked -i CHANGELOG.md --breaks >> "doc-assets/changelog.html"

csplit -f "first" docs/changelog.html '/<td class="doc-page">/'

cp first00 "docs/changelog.html"
echo '<td class="doc-page">' >> docs/changelog.html
cat "doc-assets/changelog.html" >> docs/changelog.html
echo '</td></tr><tr><td class="footer"><div><a href="https://github.com/no-stack-dub-sack/apexdox-vs-code" target="_blank" rel="noopener noreferrer">Powered By ApexDox VS Code</a></div></td></tr></table></body></html>' >> docs/changelog.html
npm run prettier:docs
rm first*

git add doc-assets/changelog.html
git add docs/changelog.html

#git commit -m "docs: update changelog"