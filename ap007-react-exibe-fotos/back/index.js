const axios = require('axios')
const cors = require('cors')
const express = require('express')
const app = express()
app.use(cors())
app.use(express.json())


app.get('/search', async function (req, res) {
  const pexelsClient = axios.create({
    baseURL: 'https://api.pexels.com/v1',
    headers: {
      Authorization: 'a91Qyfh2Ud1rdeOGKV8aTR5Aj9UmRvdma6EdyhC9EfKStoAyt7rmDuhV'
    }
  })
  const { data } = await pexelsClient.get('/search', {
    params: {
      query: req.query.query
    }
  })
  console.log(data)
  res.json(data)
})

const port = 3000
app.listen(port, () => console.log(`Back. ${port}`))