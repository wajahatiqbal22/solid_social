import * as functions from "firebase-functions";
import { HttpsError } from "firebase-functions/v1/auth";
import { StreamChat } from "stream-chat";
import { config } from "../config/config";
export const generateStreamchatToken = functions.region('asia-south1').https.onCall((data, context) => {

    // Get user id from authentication when user calls this function
    var userId = context.auth?.uid;

    if (!config.streamApiKey || !config.streamApiSecret) throw new HttpsError("invalid-argument", "No API Config key or secret found for Stream API");
    // If null, then means user is unauthenticated and returns from the function
    if (userId == null) throw new functions.https.HttpsError('internal', 'User not authenticated');


    try {

        // initialize stream-chat api with SDK
        const serverClient = StreamChat.getInstance(config.streamApiKey, config.streamApiSecret);
        // you can still use new StreamChat('api_key', 'api_secret'); 

        // generate a token for the user with id 
        const token = serverClient.createToken(userId);
        // next, hand this token to the client
        return {
            statusCode: 200,
            token,
        };
    } catch (e) {
        throw new HttpsError('internal', `There was an error: ${e}`);
    }
});