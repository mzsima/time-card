import { Web3Storage } from 'web3.storage'

const token = process.env.API_TOKEN
const client = new Web3Storage({ token })

export async function retrieveFiles() {
  const cid =
    'bafybeidd2gyhagleh47qeg77xqndy2qy3yzn4vkxmk775bg2t5lpuy7pcu'
  // You can fetch data using any CID, even from IPFS Nodes or Gateway URLs!
  const res = await client.get(cid)
  const files = await res.files()

  for (const file of files) {
    console.log(`${file.cid}: ${file.name} (${file.size} bytes)`)
  }
}

retrieveFiles();