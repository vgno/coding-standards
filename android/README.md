# General

We follow the [Google Java Code Style](https://google-styleguide.googlecode.com/svn/trunk/javaguide.html), with some exceptions:

**3.3.1** Wildcard imports are allowed in unit tests

(Why: Both JUnit and Robolectric code is prettier when you can use `assertEquals` and `mock` without class prefixing)

**4.2** Block indentation: 4 spaces. Continuation indent: Also 4 spaces

**4.4** Column limit is not strictly enforced, but do ask yourself if lines over 120-130 columns wide should be split.

(Why: 80 or 100 limit is archaic - limited by printers/console width of earlier age. Makes code less readable in a modern IDE, in my opinion)

**5.2.5** 	Non-constant field name - we use mPrefixing on private and PascalCasing on public fields. Examples:
      
    public String SomeString;
    private String mSomeString;
    
(Why: Google uses mPrefixing in the Android SDK. PascalCasing in addition completes the  distiguishing between private fields, public fields and local variables)

# Example class

```
package no.vg.someapp;

import android.media.MediaPlayer;

/**
 * This class is a shallow example of the Google Coding standards
 */
public class ExampleClass {
    private static final String SOME_CONSTANT = "Zoink";
    private static final MediaPlayer MediaPlayer = new MediaPlayer(); // Mutable => not constant
    /** It's a good practice to use JavaDoc-style comments on non-descriptive fields */
    public static String SomeStaticField;
    private int mField;
    public String CurrentTitle;
    private enum SomeEnum { ONE, TWO };

    public int getField() {
        return mField;
    }

    /**
     * Chops off count number of characters at the end of the String
     * @param string The input string
     * @param count number of characters to chop. Can be larger than the length of the string.
     */
    public String chop(String string, int count) {
        if (string == null) {
            throw new IllegalArgumentException("String must be provided");
        }
        int endIx = Math.min(string.length(), count - 1);
        return string.substring(0, endIx);
    }

    /** Assigns a random number between 0 and 10 to the field */
    public void setFieldValueRandomly() {
        double randVal = Math.random() * 10;
        mField = (int) (randVal);
    }
}
```

# Automatic enforcing

Please import the file `as-vg-codestyle.jar` to all new projects. It will enforce some (but not all - [example](https://youtrack.jetbrains.com/issue/IDEA-136090)) of the rules described in the coding standards above. If you find discrepancies, please modify the inspection profile and uptade it in this repo.

You import the profile by going to `Settings > Insepcitons > Import`

The following were exported to the .jar, and will cause the following to be enforced:

 - Code style (4-space-tabs, mPrefix for code generation)  
 - File templates (no @author stuff in class header)
 - Editor, Inspection profile (..) (variable naming code inspection. m-prefixing not inspected due to lack of IDE support. Editor config manually deleted from jar before publishing)
 
Strive to get "green light" in every file (the indicator on top of the scrollbar in every file open in Android Studio)

I've also looked into  [CheckStyle](http://checkstyle.sourceforge.net/) for checking the code server-side. One problem is that CheckStyle doesn't support the differentiation we and Google do between mutable and non-mutable final static field - in other words detecting what a *real constant* is. We could benefit from it though, but it needs a lot of configuring. 
