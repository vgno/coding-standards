# General

We follow the [Google Java Code Style](https://google-styleguide.googlecode.com/svn/trunk/javaguide.html), with some exceptions:

**3.3.1** Wildcard imports are allowed in unit tests

**4.1.1** You can ommit braces for single-statement `if` (but not for single-statement `for`).
	
	
**5.2.5** 	Non-constant field name - we use mPrefixing on private and PascalCasing on public fields. Examples:
      
    public String SomeString;
    private String mSomeString;
	
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
        if (string == null) throw new IllegalArgumentException("String must be provided");
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

I am looking into enforcing these rules automatically through the use of [CheckStyle](http://checkstyle.sourceforge.net/) or semi-automatically through Android Studio Code Inspection. The problem is that neither are flexible enough for our standards. CheckStyle doesn't support the differentiation we and Google do between mutable and non-mutable final static field - in other words detecting what a *real constant* is. Android Studio Code Inspection on the other hand does not support [differentiating between private and public fields](https://youtrack.jetbrains.com/issue/IDEA-136090).