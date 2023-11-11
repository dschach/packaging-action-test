# Start of designing a Github Action (workflow at first) for package version uploads

## [Changelog](./CHANGELOG.md)

Production install: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t3a0000004321AAC

Sandbox install: https://test.salesforce.com/packaging/installPackage.apexp?p0=04t3a0000004321AAC

Things to do in the packaging workflow:

1. Release-please action runs
   |output|description|
   |---|---|
   releases_created|true if the release was created, false otherwise
   upload_url|Directly related to Create a release API
   html_url|Directly related to Create a release API
   tag_name|Directly related to Create a release API
   major|Number representing major semver value
   minor|Number representing minor semver value
   patch|Number representing patch semver value
   sha|sha that a GitHub release was tagged at
   pr|The JSON string of the PullRequest object (undefined if no release created)
   prs|The JSON string of the array of PullRequest objects (undefined if no release created)

2. Checkout repo

3. Parse release-please-config.json or .release-please-manifest.json

   1. Find the path (?)
   2. Use that to get the sfdx packageDirectories entry (use default if only one path)
   3. Match the package value wiht the PackageAliases to get the package number or just use the package name

4. Pull sfdx-project.json into multiple outputs

   1. major
   2. minor
   3. patch
   4. namespace (take from file? maybe in marketplace action)

5. Don't take version name from anything - in sfdx-project is fine
6. If this is an action, allow an input for "promote" (true/false)

All variables involved:

- major
- minor
- patch
- namespace
- package ID

Inputs (when productized)

- target-org?
- installation-key?
