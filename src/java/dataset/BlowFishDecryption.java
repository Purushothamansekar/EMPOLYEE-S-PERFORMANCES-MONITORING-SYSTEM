package dataset;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class BlowFishDecryption {

    byte[] keyBytes = new byte[] {
        0x73, 0x2f, 0x2d, 0x33, (byte) 0xc8, 0x01, 0x73, 0x2b, 0x72,
        0x06, 0x75, 0x6c, (byte) 0xbd, 0x44, (byte) 0xf9, (byte) 0xc1
    };

    SecretKeySpec skeySpec;

    public BlowFishDecryption() {
        skeySpec = new SecretKeySpec(keyBytes, "Blowfish");
    }

    public String toDecrypt(String encrypted) {
        try {
            Cipher cipher = Cipher.getInstance("Blowfish");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);

            byte[] decoded = Base64.getDecoder().decode(encrypted);
            byte[] original = cipher.doFinal(decoded);

            return new String(original, "UTF-8");

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}