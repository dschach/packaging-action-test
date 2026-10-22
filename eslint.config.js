const eslintConfigPrettier = require('eslint-config-prettier/flat');
const lwcConfig = require('@salesforce/eslint-config-lwc');
const auraPlugin = require('@salesforce/eslint-plugin-aura');

// Shared configs have no "files" key, so scope each one to its own folder.
const scope = (files, configs) => configs.map((config) => ({ ...config, files }));

module.exports = [
	{
		ignores: ['.sfdx/**', '.sf/**', '**/*.json']
	},
	eslintConfigPrettier,
	{
		rules: {
			'vars-on-top': 'off',
			curly: ['error', 'all'],
			'lines-around-comment': [
				'error',
				{
					beforeBlockComment: true,
					afterBlockComment: true,
					beforeLineComment: true,
					afterLineComment: true,
					allowBlockStart: true,
					allowBlockEnd: true,
					allowObjectStart: true,
					allowObjectEnd: true,
					allowArrayStart: true,
					allowArrayEnd: true
				}
			],
			'no-tabs': ['error', { allowIndentationTabs: true }],
			'no-unexpected-multiline': 'off'
		}
	},
	...scope(['**/lwc/**/*.js'], lwcConfig.configs.recommended),
	{
		files: ['**/lwc/**/*.test.js'],
		rules: {
			'@lwc/lwc/no-unexpected-wire-adapter-usages': 'off'
		}
	},
	...scope(['**/aura/**/*.js'], auraPlugin.configs.recommended),
	{
		files: ['**/aura/**/*.js'],
		rules: {
			'vars-on-top': 'off',
			'no-unused-expressions': 'off'
		}
	}
];
