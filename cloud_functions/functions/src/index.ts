import * as admin from "firebase-admin";
import { addUserToChannel } from "./streamchat/add_user_to_channel";
import { addUserToStreamchat } from "./streamchat/add_user_to_streamchat";
import { generateStreamchatToken } from "./streamchat/generate_streamchat_token";
import { updateUserToStreamchat } from "./streamchat/update_user_to_streamchat";

admin.initializeApp();

export {
    addUserToStreamchat,
    generateStreamchatToken,
    addUserToChannel,
    updateUserToStreamchat
};

