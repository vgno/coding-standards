# Overview

This document provides the coding standards and guidelines for developers and teams working for or with VG.

## Goals

Good coding standards are important in any development project, particularly when multiple developers are working on the same project. Having coding standards helps to ensure that the code is of high quality, has fewer bugs, and is easily maintained.

## Golden Rule

**Always imitate the existing coding standard in existing projects OR convert them. Do not mix!**

## Coding style

Use [PSR-4](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-4-autoloader.md) for file structure and autoloading.

We build on top of [PSR-1](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-1-basic-coding-standard.md) and [PSR-2](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2-coding-style-guide.md) so make sure to read and understand them first.

## Structure

  - Add a single space after each comma delimiter.
  - Add a single space around binary operators (==, &&, ...).
  - Place unary operators (!, --, ...) adjacent to the affected variable.
  - Add a comma after each array item in a multi-line array, even after the last one.
  - Add a blank line before return statements, unless the return is alone inside a statement-group (like an if statement).
  - Use braces to indicate control structure body regardless of the number of statements it contains.
  - Define one class per file.
  - Declare class properties before methods.
  - Declare public methods first, then protected ones and finally private ones. The exceptions to this rule are the class constructor and the setUp and tearDown methods of PHPUnit tests, which should always be the first methods to increase readability.
  - Use parentheses when instantiating classes regardless of the number of arguments the constructor has.
  - Exception message strings should be concatenated using sprintf.
  - Lines must end with a single linefeed (LF) character, no carriage returns (CR). Lines should not contain trailing spaces.

## Naming Conventions

  - Use camelCase, not underscores.
  - Use namespaces for all classes.
  - Prefix abstract classes with **Abstract**.
  - Suffix interfaces with **Interface**.
  - Suffix traits with **Trait**.
  - Suffix exceptions with **Exception**.
  - Use alphanumeric characters and underscores for file names.
  - For type-hinting in PHPDocs and casting, use bool (instead of boolean or Boolean), int (instead of integer), float (instead of double or real).
  - All files, classes, functions, variables, parameters, database names, table names etc. should be English, and as generic terms as possible.

## Inline documentation

One-line comments should use `//`, NOT the sharp `#` character. All comments must start with a space for improved readability.

```
<?php
//this is incorrect
doSomething();

// This is correct.
doSomething();
```

### API Documentation format

All documentation blocks ("docblocks") must be compatible with the phpDocumentor format. Describing the phpDocumentor format is beyond the scope of this document. For more information, visit [[http://phpdoc.org]].

Apply these rules to all code intended for the edges of your codebase where external (e.g. not you) consumption is expected.

Don't add "placeholder" docblocks that does not provide any increased value to the code. It is better to not write docblocks, than to write useless docs.

### Functions

Every function, including object methods, must have a docblock that contains at a minimum:

 - A description of the function
 - All of the arguments
 - All of the possible return values
 - If a function/method may throw an exception, use "@throws"
 
```
<?php
/**
 * Does something interesting
 *
 * @param Place $where Where something interesting takes place
 * @param int $repeat How many times something interesting should happen
 * @throws Some_Exception If something interesting cannot happen
 * @return boolean
 */
function doesSomethingInteresting(Place $where, $repeat = 1) {
    // Implementation
}
```

### Conversion

In order to convert existing project to new code standards, please use the latest version of [PHP-CS-FIXER](https://github.com/FriendsOfPHP/PHP-CS-Fixer). Also [phpcbf](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Fixing-Errors-Automatically) might be useful to improve phpcs results automatically.

In your project root create a `.php_cs` configuration file containing the following:

```php
<?php
// Folders to traverse. Multiple in() calls can be chained.
$finder = Symfony\CS\Finder\DefaultFinder::create()->in(__DIR__ . '/src');

$config = Symfony\CS\Config\Config::create();
$config
    ->level(Symfony\CS\FixerInterface::PSR2_LEVEL)
    ->fixers(array(
        '-remove_lines_between_uses',
        'concat_with_spaces',
        'multiline_array_trailing_comma',
        'namespace_no_leading_whitespace',
        'object_operator',
        'operators_spaces',
        //'ordered_use', // WARNING: causes problems with traits
        'return',
        'single_array_no_trailing_comma',
        'spaces_before_semicolon',
        'spaces_cast',
        'unused_use',
        'whitespacy_lines',
        'short_array_syntax',
    ))
    ->finder($finder);
    
return $config;
```
