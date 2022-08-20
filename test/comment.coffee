{testCase} = require "./helper"

describe "comment", ->
  testCase """
    keeps comments as written
    ---
    // Hi
    ---
    // Hi
  """

  testCase """
    keeps comments at beginning and end of file
    ---
    // Hi
    x
    /* bye */
    ---
    // Hi
    x;
    /* bye */
  """

  testCase """
    CoffeeScript style multi-line comments
    ---
    ###
    hi
    ###

    ---
    /*
    hi
    */

  """

  testCase """
    remains after empty statement in nested block
    ---
    ->
      ; // Hey
    ---
    function() {
      ; // Hey
    };
  """

  testCase """
    inline stays in empty statement
    ---
    ->
      /**/; // Hey
    ---
    function() {
      /**/; // Hey
    };
  """
