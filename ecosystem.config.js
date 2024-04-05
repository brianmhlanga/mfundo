module.exports = {
    apps: [
      {
        name: 'Mfundo Online Exams',
        port: '3017',
        exec_mode: 'cluster',
        instances: '1',
        script: './.output/server/index.mjs' 
      }
    ]
  }