package it.alcacoop.travelwallet;

import android.os.Bundle;
import org.apache.cordova.*;

public class TravelWalletActivity extends DroidGap {
    public static TravelWalletActivity Instance;

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
	TravelWalletActivity.Instance = this;
        super.onCreate(savedInstanceState);
        super.loadUrl("file:///android_asset/www/index.html");
    }
}
