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
   3. Match the package value with the PackageAliases to get the package number or just use the package name

4. Pull sfdx-project.json into multiple outputs

   1. major
   2. minor
   3. patch
   4. namespace (take from file? maybe in marketplace action)
   5. packageName
      1. Use to find PackageId in "packageAliases" section

5. Don't take version name from anything - in sfdx-project is fine
6. If this is an action, allow an input for "promote" (true/false)
7. Query existing package?
   1. TODO: Find what info we may need from package
8. Find existing version number (max)
   1. Move existing version number to ancestor IF there is a managed package
   2. Leave it alone if "HIGHEST" or is an ID

All variables involved:

- major
- minor
- patch
- namespace
- package ID

Inputs (when productized)

- wait (default 10, allow override)
- verbose (default true)
- target-org
- dev hub auth-url (is this secure?)
- package-name (find the packageDirectories node and use those values)
  - optional and use default if not supplied?
- optional inputs
  - ancestorId / ancestorVersion / HIGHEST
  - version name (as override)
  - target-dev-hub
  - api-version
  - branch
  - code-coverage
  - definition-file
  - installation-key
  - installation-key-bypass (true if no value for installation-key)
  - path (as override) <- this one is interesting
  - post-install-script
  - post-install-url
  - release-notes-url
  - skip-ancestor-check
  - skip-validation
  - tag
  - uninstall-script
  - version-description
  - version-name
  - version-number
  - language

```
packageDirectories contents:
ancestorId
ancestorVersion
default
definitionFile
namespace
package
packageAliases
path
seedMetadata
versionDescription
versionName
versionNumber
```

```
Package Version Create Request
=== Package Version Create Request
NAME                            VALUE
─────────────────────────────   ────────────────────
Version Create Request Id       08cB00000004CBxIAM
Status                          InProgress
Package Id                      0HoB00000004C9hKAE
Package Version Id              05iB0000000CaaNIAS
Subscriber Package Version Id   04tB0000000NOimIAG
Tag                             git commit id 08dcfsdf
Branch
CreatedDate                     2018-05-08 09:48
Installation URL
https://login.salesforce.com/packaging/installPackage.apexp?p0=04tB0000000NOimIAG
```
