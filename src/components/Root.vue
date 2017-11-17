<template>
  <div>
    <h1>{{ msg }}</h1>
    <h2>{{ ownerAddress }}</h2>
  </div>
</template>

<script>
import Ledger from '@/js/ledger'

export default {
  name: 'root',
  data () {
    return {
      msg: 'Pulsar - Decentralized AI Powered Trading Platform',
      ownerAddress: undefined
    }
  },
  beforeCreate: function () {
    Ledger.init().then(() => {
      return Ledger.owner()
    }).then(address => {
      this.ownerAddress = address
    }).catch(err => {
      console.log(err)
    })
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
  display: block;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
