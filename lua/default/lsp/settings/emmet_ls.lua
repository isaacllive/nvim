-- https://github.com/pedro757/emmet
-- npm i -g ls_emmet
return {
	cmd = { 'ls_emmet', '--stdio' };
	filetypes = {
		'html',
		'css',
		'scss',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'haml',
		'xml',
		'xsl',
		'pug',
		'slim',
		'sass',
		'stylus',
		'less',
		'sss',
		'hbs',
		'handlebars',
	};
	root_dir = function(fname)
		return vim.loop.cwd()
	end;
	settings = {};
};
