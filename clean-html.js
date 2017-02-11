'use strict'

const sanitizeHTML = require('sanitize-html')

const sanitizeHTMLOptions = {
  allowedTags: [
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'blockquote',
    'p',
    'a',
    'ul',
    'ol',
    'nl',
    'li',
    'b',
    'i',
    'strong',
    'em',
    'strike',
    'code',
    'hr',
    'br',
    'table',
    'thead',
    'caption',
    'tbody',
    'tr',
    'th',
    'td',
  ],
  allowedAttributes: {
    a: ['href', 'target'],
  },
  parser: {
    lowerCaseTags: true,
  },
}

// Get the HTML code as CLI parameter
const inputHTML = process.argv[2]

const cleanHTML = sanitizeHTML(inputHTML, sanitizeHTMLOptions).trim()

console.log(cleanHTML)
