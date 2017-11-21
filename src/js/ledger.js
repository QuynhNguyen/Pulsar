import Contract from 'truffle-contract'
import LedgerContract from '@contracts/Ledger.json'

const Ledger = {

  contract: null,

  instance: null,

  init: function () {
    let self = this

    return new Promise((resolve, reject) => {
      self.contract = Contract(LedgerContract)
      self.contract.setProvider(window.web3.currentProvider)

      self.contract.deployed().then(instance => {
        self.instance = instance
        resolve()
      }).catch(err => {
        reject(err)
      })
    })
  },

  owner: function () {
    let self = this

    return new Promise((resolve, reject) => {
      resolve(self.instance.owner())
    })
  },

  initialBalance: function () {
    let self = this

    return new Promise((resolve, reject) => {
      resolve(self.instance.initialBalance())
    })
  },

  increaseBalance: function (amount) {
    let self = this

    return new Promise((resolve, reject) => {
      self.instance.increaseInitialBalance({
        from: window.web3.eth.accounts[0],
        value: window.web3.toWei(amount, 'ether')
      }).then(tx => {
        resolve(tx)
      }).catch(err => {
        reject(err)
      })
    })
  }
}

export default Ledger
