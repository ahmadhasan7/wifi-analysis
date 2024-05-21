package com.example.majdwifi;

import android.os.Bundle;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "MajdMethodChannel";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if(call.method.equals("Printy")){
                                String data="heeeeeellllllllloooooo";
                                result.success(data);

                            }
                            if (call.method.equals("scanWiFiNetworks")) {
                                try {
                                    result.success(scanWiFiNetworks());
                                } catch (IOException e) {
                                    result.error("SCAN_ERROR", e.getMessage(), null);
                                }
                            } else if (call.method.equals("parseNetworks")) {
                                String networksOutput = call.argument("networksOutput");
                                result.success(parseNetworks(networksOutput));
                            } else if (call.method.equals("analyzeWiFiNetwork")) {
                                String networkSSID = call.argument("networkSSID");
                                try {
                                    result.success(analyzeWiFiNetwork(networkSSID));
                                } catch (IOException e) {
                                    result.error("ANALYZE_ERROR", e.getMessage(), null);
                                }
                            } else if (call.method.equals("parseSecurityInfo")) {
                                String securityInfo = call.argument("securityInfo");
                                result.success(parseSecurityInfo(securityInfo));
                            } else if (call.method.equals("testPasswordStrength")) {
                                String password = call.argument("password");
                                result.success(testPasswordStrength(password));
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    public static String scanWiFiNetworks() throws IOException {
        String os = System.getProperty("os.name").toLowerCase();
        String networksOutput;
        if (os.contains("win")) {
            Process process = Runtime.getRuntime().exec("netsh wlan show networks");
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            networksOutput = output.toString();
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
            Process process = Runtime.getRuntime().exec("nmcli -t -f ssid,signal dev wifi");
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            networksOutput = output.toString();
        } else {
            throw new UnsupportedOperationException("Unsupported operating system");
        }
        return networksOutput;
    }

    public static List<List<String>> parseNetworks(String networksOutput) {
        String os = System.getProperty("os.name").toLowerCase();
        List<List<String>> networkList = new ArrayList<>();
        if (os.contains("win")) {
            Pattern pattern = Pattern.compile("SSID \\d+ : (.+)");
            Matcher matcher = pattern.matcher(networksOutput);
            while (matcher.find()) {
                String ssid = matcher.group(1);
                //networkList.add(new ArrayList<>(List.of(ssid, "")));
            }
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
            String[] lines = networksOutput.trim().split("\n");
            for (String line : lines) {
                String[] parts = line.split(":");
                if (parts.length >= 2) {
                    String ssid = parts[0];
                    String signal = parts[1];
                    //networkList.add(new ArrayList<>(List.of(ssid, signal)));
                }
            }
        } else {
            throw new UnsupportedOperationException("Unsupported operating system");
        }
        return networkList;
    }

    public static String analyzeWiFiNetwork(String networkSSID) throws IOException {
        String os = System.getProperty("os.name").toLowerCase();
        String securityInfo;
        if (os.contains("win")) {
            Process process = Runtime.getRuntime().exec("netsh wlan show networks mode=Bssid ssid=\"" + networkSSID + "\"");
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            securityInfo = output.toString();
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
            Process process = Runtime.getRuntime().exec("nmcli -t -f security dev wifi show \"" + networkSSID + "\"");
            BufferedReader reader= new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            securityInfo = output.toString();
        } else {
            throw new UnsupportedOperationException("Unsupported operating system");
        }
        return securityInfo;
    }

    public static List<String> parseSecurityInfo(String securityInfo) {
        String os = System.getProperty("os.name").toLowerCase();
        List<String> securityInfoParsed = new ArrayList<>();
        if (os.contains("win")) {
            Pattern authModePattern = Pattern.compile("Authentication\\s+:\\s+(.+)");
            Matcher authModeMatcher = authModePattern.matcher(securityInfo);
            if (authModeMatcher.find()) {
                securityInfoParsed.add(authModeMatcher.group(1));
            }
            Pattern cipherPattern = Pattern.compile("Cipher\\s+:\\s+(.+)");
            Matcher cipherMatcher = cipherPattern.matcher(securityInfo);
            if (cipherMatcher.find()) {
                securityInfoParsed.add(cipherMatcher.group(1));
            }
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
            Pattern authModePattern = Pattern.compile("802-11-wireless-security.key-mgmt\\s+(.+)");
            Matcher authModeMatcher = authModePattern.matcher(securityInfo);
            if (authModeMatcher.find()) {
                securityInfoParsed.add(authModeMatcher.group(1));
            }
            Pattern cipherPattern = Pattern.compile("802-11-wireless-security.proto\\s+(.+)");
            Matcher cipherMatcher = cipherPattern.matcher(securityInfo);
            if (cipherMatcher.find()) {
                securityInfoParsed.add(cipherMatcher.group(1));
            }
        } else {
            throw new UnsupportedOperationException("Unsupported operating system");
        }
        return securityInfoParsed;
    }

    public static int testPasswordStrength(String password) {
        int score = 0;
        if (password.length() >= 8) {
            score++;
        }
        if (password.matches("(?=.*[a-z])(?=.*[A-Z]).*")) {
            score++;
        }
        if (password.matches("(?=.*\\d).*")) {
            score++;
        }
        if (password.matches("(?=.*[~!@#$%^&*()_-]).*")) {
            score++;
        }
        return score;
    }
}
