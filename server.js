if (process.env.NODE_ENV !== 'production') require('dotenv').config();

const app = require('app');
const port = process.env.PORT || 3000;

client_ID = process.env.GOOGLE_CLIENT_ID || '546911211316-o57he3sbdaei0toec3fn6mv6tchbrm7c.apps.googleusercontent.com'
client_secret = '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'
server_root_uri ='http://localhost:3000'
jwt_secret ='test101'
cookie_name ='auth_token'



//get google oauth info
const googleAuth = (client_ID, callbackURI) =>{
  //get google root url
  const rootUrl = 'https://accounts.google.com/o/oauth2/v2/auth';
  const options = {
    //passing root url, callback url, and client id
    redirect_uri: `${CORS_ORIGIN}/auth/google`,
    client_id: client_ID,
    access_type: 'offline',
    response_type: 'code',
    prompt: 'consent',
    scope: [
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/userinfo.email',
    ].join(' '),
  }
}


app.listen(port, () => {
  console.log(`Express server is up on port ${port}`);
});