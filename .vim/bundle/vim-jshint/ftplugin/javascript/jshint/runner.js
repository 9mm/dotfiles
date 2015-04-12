#!/usr/bin/env node

var jshint = require('jshint').JSHINT;
var puts = require('util').puts;
var stdin = process.openStdin();
var fs = require('fs');
var jshintrc = process.argv[2] ? fs.readFileSync(process.argv[2], 'utf8') : '';
var body = [];

var docblock = require('jstransform/src/docblock');
var react = require('react-tools');

function allcomments(s) {
  return (/^(?:\s*\/\/[^\n]*\s*|\s*\/\*(?:[^\*]|\*(?!\/))*\*\/\s*)*$/).test(s);
}

// This function will produce incorrect results for certain pathological
// expressions involving regexp literals. This is okay, since it's only meant
// to be used on JSON-with-comments, and JSON doesn't have regexp literals.
function removecomments(s) {
  var re = /("([^"]|\\")*")|('([^']|\\')*')|\/\/[^\n]*|\/\*(?:[^\*]|\*(?!\/))*\*\//g;
  return s.replace(re, function(x) {
    return (/^["']/).test(x) ? x : ' ';
  });
}

stdin.on('data', function(chunk) {
  body.push(chunk);
});

stdin.on('end', function() {
  var error,
    i,
    len,
    options,
    prefix = '',
    offset = 0,
    data;

  if (allcomments(jshintrc)) {
    prefix = jshintrc + '\n';
    offset = prefix.split('\n').length - 1;
  } else {
    // Try standard `.jshintrc` JSON format.
    try {
      options = JSON.parse(removecomments(jshintrc));
    } catch(e) {
      puts('1:1:Invalid ~/.jshintrc file');
    }
  }

  var globals;

  if (options && options.globals) {
    globals = options.globals;
    delete options.globals;
  }

  var source = body.join('');
  var hasDocblock = docblock.parseAsObject(docblock.extract(source)).jsx;

  if (hasDocblock) try {
    source = react.transform(source, {harmony: true});
  } catch(e) {
    puts('Error parsing React JSX');
    return;
  }

  if( jshint( prefix + source, options, globals ) ){
    return;
  }

  data = jshint.data();

  for( i = 0, len = data.errors.length; i < len; i += 1 ){
    error = data.errors[i];
    if( error && error.reason ){
      puts( [error.line - offset, error.character, error.reason].join(':') );
    }
  }

});

