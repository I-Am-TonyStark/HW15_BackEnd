package com.mamalimomen.base.controllers.utilities;

import com.google.gson.Gson;
import org.json.simple.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

public final class SMSPanel {
    private static final String TOKEN_URL = "https://RestfulSms.com/api/Token";
    private static final String SMS_SEND_URL = "https://RestfulSms.com/api/MessageSend";

    private String getApiToken() {
        JSONObject json = new JSONObject();
        json.put("UserApiKey", "###");
        json.put("SecretKey", "###");

        HttpClient client = HttpClient.newBuilder().build();

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(TOKEN_URL))
                .timeout(Duration.ofSeconds(30))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(json.toJSONString()))
                .build();

        HttpResponse<String> response = null;
        try {
            response = client.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        Gson gson = new Gson();
        ApiTokenResponse apiTokenResponse = gson.fromJson(response.body(), ApiTokenResponse.class);
        System.err.println(apiTokenResponse.getTokenKey());
        return apiTokenResponse.getTokenKey();
    }

    public void sendSMS(String message, String phoneNumber) {
        String apiToken = this.getApiToken();
        String json = "{" +
                "Messages:" + "[" + "\"" + message + "\"" + "]" + "," +
                "MobileNumbers:" + "[" + "\"" + phoneNumber + "\"" + "]" + "," +
                "LineNumber:" + "\"" + "30002101004094" + "\"" + "," +
                "SendDateTime:" + "\"" + "" + "\"" + "," +
                "CanContinueInCaseOfError:" + "\"" + "false" + "\"" + "," +
                "}";

        System.err.println(json);

        HttpClient client = HttpClient.newBuilder()
                .build();

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(SMS_SEND_URL))
                .timeout(Duration.ofSeconds(30))
                .header("x-sms-ir-secure-token", apiToken)
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(json))
                .build();

        HttpResponse<String> response = null;
        try {
            response = client.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.err.println(response.body());
    }

    private static class ApiTokenResponse {
        private String TokenKey;

        public String getTokenKey() {
            return TokenKey;
        }

        public void setTokenKey(String tokenKey) {
            TokenKey = tokenKey;
        }
    }
}
