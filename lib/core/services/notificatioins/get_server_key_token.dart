// import 'dart:developer';
// import 'package:googleapis_auth/auth_io.dart' as auth;

// class GetServerKeyToken {
//   final serviceAccountJson = {
//     'type': 'service_account',
//     'project_id': 'shopify-761e9',
//     'private_key_id': '4d5284e1b72458428529e54cc6786bee9799b509',
//     'private_key':
//         '-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnGtbL9x/Lgkln\nkz7MllLuyAgQaTR4/qaeS8eM2PBpZnINQ7e6PG26R9FjZJVWzaYSiuiWuXPJqqbS\ntwFIMtmJVPeUJUJcUq4ZpTXQADLHnA6QzVkbexGBRd7n0eQcF+Z+TkGMq+c3uV8X\n7FooE/nKnquW0TocgLd6kstYsMScyxKqw2gFodSQSiq8tFHlRFoQppR14M+QEvle\nnfSjcF2NRv/pJFiehZSUYjIjejrR3Cn7qTrky1hE1qhOb3Z9dLBgY9G3yJl0iKXn\nGCJpzIInVn/4pF3q+eR254KlOplkHmfHxngrn4KbQadWl+0iW/ldRB0BHgZaR9q6\n9X7T6vBHAgMBAAECggEAczkDbPAKLyoHNRfJ0LEGKj0bICuD2OuF4RiBJm0m+DX2\nmTxxBu6H+r9B219TwdKIgWg2bKeL3jkyMY7Cmd+YbAsr4PXurx8d5HVlbg4bQ0BA\nVtu7GKN0Z9KRP117cLJN3h1gOyWeAz9t9PyHOsIy4V3YyToJ0hou4HL95XtEm7MF\nO/N+GknAiQGjkDVdsYWVGA+N7QJsTRXyBA9mx++R3tt1d0VJRFG31mF2rVZo8Kjf\nfnAAHggJYtvByk0LJW1rsmQDOYghEdXiOJ4qBSp791TaqMIzFi1p40WKLDqXa67M\n+ZD87CNWVg0kIqcef6IIBx/tAweHoDd64zZulS+uwQKBgQD5tQ7bdwXVsAgngS4U\n6jdFysc8Xm0eCYkeL0VCn8D59iGOixZRDywD5OI95GxxP288RynkMe7KZr0M2Z8k\nJiCa48V/zzIIXCnQ/fFpzDFEs2F0BHtSTTMv0N9kv9eJrJ93cj3ywdbuao1qVD/7\ntqvlx7UEuPHCyQ5DOjGm8JnHpwKBgQDs7cVUpGwidJdwKPjmfG6H2I6feC9HMkQi\nUwXIFwzB0MCjewGPbNqIEwutpiiGcYNjt56eUNUFj0YMcssvtzqgviyIAM1zxSJy\n7PS3AccC/dmYBrTNd94pj5r3tBm5Ignn/LwT5Q2faBOD3Du+oUf0nL5oYnZICPpj\nX4EJwlCmYQKBgDGV6KtgCUKTwCrIFjSFBhDP4Zx1S8nJLvdVf7VpL9LzM1qw9++E\nycLEMsEDmR0r8ZTQtNrhp399w1DH7jgpchQP4uosZM0QMCWWJ9hQegAgdtupACwp\ntF5sZdAF4HEwXEJF51NLdrjFY+uXa1U6wwvQCnwzlZ6OekyTQ8TYxlDFAoGAWQjx\nQuGXEUunLSr4fgT8tGgZEKxld+fX2t5AKfUfgiYkfkrXR0KszL37gYITcJJvwaVb\nIjtWEgTJWhw5ZvEAQy+0JFfI3VyTmYSaYbt1QhaLEqpSf3QwNIYWwkcX845rEpbT\nRtaoy+KckszMVtLc63uLwkZeFKvrDDTzlOtEy4ECgYEAnkC9k8VUBIdp2rShLi52\ndsYY737wisxpah7t1AgyFgCLOjbm4JRilOQYakabkRB5piTRCA46jujJ7uuvlsXI\naDFhCo8tt3ybSsP1FXp3Dd3HDo/zJdu5tHNYpa/Vpt3z00UiEdxX7Eous0DO/8/4\n93u35PEVB+rEqF9e+1hWlPU=\n-----END PRIVATE KEY-----\n',
//     'client_email':
//         'firebase-adminsdk-s5jnh@shopify-761e9.iam.gserviceaccount.com',
//     'client_id': '116551645823670234293',
//     'auth_uri': 'https://accounts.google.com/o/oauth2/auth',
//     'token_uri': 'https://oauth2.googleapis.com/token',
//     'auth_provider_x509_cert_url': 'https://www.googleapis.com/oauth2/v1/certs',
//     'client_x509_cert_url':
//         'https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-s5jnh%40shopify-761e9.iam.gserviceaccount.com',
//     'universe_domain': 'googleapis.com',
//   };
//   List<String> scopes = [
//     'https://www.googleapis.com/auth/firebase.messaging',
//     'https://www.googleapis.com/auth/userinfo.email',
//     'https://www.googleapis.com/auth/firebase.database',
//   ];
//   Future<String> getServerKeyToken() async {
//     try {
//       final client = await auth.clientViaServiceAccount(
//         auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//         scopes,
//       );
//       final accessToken = client.credentials.accessToken.data;
//       client.close();
//       return accessToken;
//     } catch (e) {
//       log('Error fetching server key token: $e');
//       throw Exception('Error fetching server key token: $e');
//     }
//   }
// }
