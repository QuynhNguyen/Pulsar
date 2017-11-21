<template>
  <div>
    <h1>{{ msg }}</h1>
    <h2>Contract Owned By: {{ ownerAddress }}</h2>
    <h2>Contract Initial Balance: {{ initialBalance }}</h2>
    <h3>Increase Initial Balance (in Ether): <input v-model="initialBalanceIncreaseAmount" /> <button v-on:click="increaseInitialBalance">submit</button></h3>
  </div>
</template>

<script>
import Ledger from '@/js/ledger'

export default {
  name: 'root',
  data () {
    return {
      msg: 'Pulsar - Decentralized AI Powered Trading Platform',
      ownerAddress: undefined,
      initialBalance: 0,
      initialBalanceIncreaseAmount: 0
    }
  },
  beforeCreate () {
    Ledger.init().then(() => {
      return Ledger.owner()
    }).then(address => {
      this.ownerAddress = address
      console.log(this.ownerAddress)
      return Ledger.initialBalance()
    }).then(initialBalance => {
      this.initialBalance = window.web3.fromWei(initialBalance, 'ether')
    }).catch(err => {
      console.log(err)
    })
  },
  methods: {
    increaseInitialBalance () {
      Ledger.increaseBalance(this.initialBalanceIncreaseAmount)
    }
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
