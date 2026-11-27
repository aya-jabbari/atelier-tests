
module.exports = {
  testDir: './e2e',

  reporter: [
    ['list'],
    ['html', { open: 'never' }]
  ],

  use: {
    baseURL: 'http://127.0.0.1:3000'
  },

  webServer: {
    command: 'npm start',
    url: 'http://127.0.0.1:3000/login.html',
    reuseExistingServer: true,
    timeout: 60000
  }
};
