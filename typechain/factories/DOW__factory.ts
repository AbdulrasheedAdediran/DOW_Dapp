/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import { Provider, TransactionRequest } from "@ethersproject/providers";
import type { DOW, DOWInterface } from "../DOW";

const _abi = [
  {
    inputs: [],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    inputs: [],
    name: "Enter4Numbers",
    type: "error",
  },
  {
    inputs: [],
    name: "InsufficientTokens",
    type: "error",
  },
  {
    inputs: [],
    name: "NotOwner",
    type: "error",
  },
  {
    inputs: [],
    name: "NumbersMustBeUnique",
    type: "error",
  },
  {
    inputs: [],
    name: "YouLost",
    type: "error",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        indexed: true,
        internalType: "address",
        name: "spender",
        type: "address",
      },
      {
        indexed: false,
        internalType: "uint256",
        name: "value",
        type: "uint256",
      },
    ],
    name: "Approval",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "uint256",
        name: "tries",
        type: "uint256",
      },
      {
        indexed: false,
        internalType: "uint256",
        name: "dead",
        type: "uint256",
      },
      {
        indexed: false,
        internalType: "uint256",
        name: "wounded",
        type: "uint256",
      },
    ],
    name: "PlayerGuesses",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "from",
        type: "address",
      },
      {
        indexed: true,
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        indexed: false,
        internalType: "uint256",
        name: "value",
        type: "uint256",
      },
    ],
    name: "Transfer",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "string",
        name: "message",
        type: "string",
      },
    ],
    name: "Warnings",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "string",
        name: "message",
        type: "string",
      },
    ],
    name: "WonOrLost",
    type: "event",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "address",
        name: "spender",
        type: "address",
      },
    ],
    name: "allowance",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "spender",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amount",
        type: "uint256",
      },
    ],
    name: "approve",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "account",
        type: "address",
      },
    ],
    name: "balanceOf",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "decimals",
    outputs: [
      {
        internalType: "uint8",
        name: "",
        type: "uint8",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "spender",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "subtractedValue",
        type: "uint256",
      },
    ],
    name: "decreaseAllowance",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "spender",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "addedValue",
        type: "uint256",
      },
    ],
    name: "increaseAllowance",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "name",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256[]",
        name: "numArr",
        type: "uint256[]",
      },
    ],
    name: "playGame",
    outputs: [
      {
        internalType: "uint256",
        name: "wounded",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "dead",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "message",
        type: "string",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "startGame",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "symbol",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "totalSupply",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amount",
        type: "uint256",
      },
    ],
    name: "transfer",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "from",
        type: "address",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amount",
        type: "uint256",
      },
    ],
    name: "transferFrom",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "_amount",
        type: "uint256",
      },
    ],
    name: "transferToCreator",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
];

const _bytecode =
  "0x60806040523480156200001157600080fd5b506040518060400160405280600f81526020017f44656164206f7220576f756e64656400000000000000000000000000000000008152506040518060400160405280600381526020017f444f57000000000000000000000000000000000000000000000000000000000081525081600390805190602001906200009692919062000298565b508060049080519060200190620000af92919062000298565b50505033600660006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055506200010f3069d3c21bcecceda10000006200011560201b60201c565b620004f4565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff16141562000188576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016200017f9062000380565b60405180910390fd5b6200019c600083836200028e60201b60201c565b8060026000828254620001b09190620003d0565b92505081905550806000808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254620002079190620003d0565b925050819055508173ffffffffffffffffffffffffffffffffffffffff16600073ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040516200026e9190620003a2565b60405180910390a36200028a600083836200029360201b60201c565b5050565b505050565b505050565b828054620002a69062000437565b90600052602060002090601f016020900481019282620002ca576000855562000316565b82601f10620002e557805160ff191683800117855562000316565b8280016001018555821562000316579182015b8281111562000315578251825591602001919060010190620002f8565b5b50905062000325919062000329565b5090565b5b80821115620003445760008160009055506001016200032a565b5090565b600062000357601f83620003bf565b91506200036482620004cb565b602082019050919050565b6200037a816200042d565b82525050565b600060208201905081810360008301526200039b8162000348565b9050919050565b6000602082019050620003b960008301846200036f565b92915050565b600082825260208201905092915050565b6000620003dd826200042d565b9150620003ea836200042d565b9250827fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff038211156200042257620004216200046d565b5b828201905092915050565b6000819050919050565b600060028204905060018216806200045057607f821691505b602082108114156200046757620004666200049c565b5b50919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b7f45524332303a206d696e7420746f20746865207a65726f206164647265737300600082015250565b612a0d80620005046000396000f3fe608060405234801561001057600080fd5b50600436106100ea5760003560e01c806370a082311161008c578063a9059cbb11610066578063a9059cbb14610273578063d65ab5f2146102a3578063dd62ed3e146102ad578063fcb1d746146102dd576100ea565b806370a08231146101f557806395d89b4114610225578063a457c2d714610243576100ea565b806318160ddd116100c857806318160ddd1461015957806323b872dd14610177578063313ce567146101a757806339509351146101c5576100ea565b806306fdde03146100ef578063095ea7b31461010d5780630b4dab981461013d575b600080fd5b6100f761030f565b6040516101049190611fe5565b60405180910390f35b61012760048036038101906101229190611c6d565b6103a1565b6040516101349190611fca565b60405180910390f35b61015760048036038101906101529190611cf6565b6103c4565b005b61016161047b565b60405161016e91906121a7565b60405180910390f35b610191600480360381019061018c9190611c1a565b610485565b60405161019e9190611fca565b60405180910390f35b6101af6104b4565b6040516101bc9190612200565b60405180910390f35b6101df60048036038101906101da9190611c6d565b6104bd565b6040516101ec9190611fca565b60405180910390f35b61020f600480360381019061020a9190611bad565b610567565b60405161021c91906121a7565b60405180910390f35b61022d6105af565b60405161023a9190611fe5565b60405180910390f35b61025d60048036038101906102589190611c6d565b610641565b60405161026a9190611fca565b60405180910390f35b61028d60048036038101906102889190611c6d565b61072b565b60405161029a9190611fca565b60405180910390f35b6102ab61074e565b005b6102c760048036038101906102c29190611bda565b610889565b6040516102d491906121a7565b60405180910390f35b6102f760048036038101906102f29190611cad565b610910565b604051610306939291906121c2565b60405180910390f35b60606003805461031e906123e3565b80601f016020809104026020016040519081016040528092919081815260200182805461034a906123e3565b80156103975780601f1061036c57610100808354040283529160200191610397565b820191906000526020600020905b81548152906001019060200180831161037a57829003601f168201915b5050505050905090565b6000806103ac610c58565b90506103b9818585610c60565b600191505092915050565b600660009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161461044b576040517f30cd747100000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b61047830600660009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1683610e2b565b50565b6000600254905090565b600080610490610c58565b905061049d8582856110ac565b6104a8858585610e2b565b60019150509392505050565b60006012905090565b6000806104c8610c58565b905061055c818585600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461055791906122bf565b610c60565b600191505092915050565b60008060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b6060600480546105be906123e3565b80601f01602080910402602001604051908101604052809291908181526020018280546105ea906123e3565b80156106375780601f1061060c57610100808354040283529160200191610637565b820191906000526020600020905b81548152906001019060200180831161061a57829003601f168201915b5050505050905090565b60008061064c610c58565b90506000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054905083811015610712576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161070990612167565b60405180910390fd5b61071f8286868403610c60565b60019250505092915050565b600080610736610c58565b9050610743818585610e2b565b600191505092915050565b6000600760003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000209050610799611138565b6107ac3368056bc75e2d631000006111be565b5b6004816001018054905010156108865760006107c761131e565b90506000805b836001018054905081101561082057828460010182815481106107f3576107f26125d4565b5b9060005260206000200154141561080d5760019150610820565b808061081890612446565b9150506107cd565b508061087f5782600101829080600181540180825580915050600190039060005260206000200160009091909190915055818360030160006001866001018054905061086c9190612315565b8152602001908152602001600020819055505b50506107ad565b50565b6000600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054905092915050565b600080606083600481511461095a576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610951906120a7565b60405180910390fd5b6001151561096782611380565b1515146109a9576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016109a0906120c7565b60405180910390fd5b6109b285611429565b80945081955050506000600760003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000209050683635c9adc5dea00000610a1033610567565b108015610a1d5750600484145b15610a2b57610a2a61074e565b5b683635c9adc5dea00000610a3e33610567565b108015610a4b5750600484105b15610ac657610a5984611565565b925060008160000160006101000a81548160ff021916908360ff1602179055507f724a5668431aac6c0fa9dcb7110322ca2fee6b029956d275c779ffcd6f0b06b48160000160009054906101000a900460ff168587604051610abd9392919061221b565b60405180910390a15b610ad933683635c9adc5dea0000061189a565b80600001600081819054906101000a900460ff1680929190610afa9061248f565b91906101000a81548160ff021916908360ff16021790555050858160020160008360000160009054906101000a900460ff1660ff1681526020019081526020016000209080519060200190610b50929190611a7b565b5060088160000160009054906101000a900460ff1660ff161180610b745750600484145b15610b8257610b8161074e565b5b60088160000160009054906101000a900460ff1660ff161115610bda576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610bd190612147565b60405180910390fd5b610be384611565565b925060008160000160006101000a81548160ff021916908360ff1602179055507f724a5668431aac6c0fa9dcb7110322ca2fee6b029956d275c779ffcd6f0b06b48160000160009054906101000a900460ff168587604051610c479392919061221b565b60405180910390a150509193909250565b600033905090565b600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff161415610cd0576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610cc790612127565b60405180910390fd5b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415610d40576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610d3790612047565b60405180910390fd5b80600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92583604051610e1e91906121a7565b60405180910390a3505050565b600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff161415610e9b576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610e9290612107565b60405180910390fd5b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415610f0b576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610f0290612007565b60405180910390fd5b610f16838383611a71565b60008060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054905081811015610f9c576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610f9390612087565b60405180910390fd5b8181036000808673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550816000808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825461102f91906122bf565b925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef8460405161109391906121a7565b60405180910390a36110a6848484611a76565b50505050565b60006110b88484610889565b90507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff81146111325781811015611124576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161111b90612067565b60405180910390fd5b6111318484848403610c60565b5b50505050565b6000600760003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002090505b6000816001018054905011156111bb57806001018054806111a05761119f6125a5565b5b6001900381819060005260206000200160009055905561117c565b50565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff16141561122e576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161122590612187565b60405180910390fd5b61123a60008383611a71565b806002600082825461124c91906122bf565b92505081905550806000808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008282546112a191906122bf565b925050819055508173ffffffffffffffffffffffffffffffffffffffff16600073ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef8360405161130691906121a7565b60405180910390a361131a60008383611a76565b5050565b600080600a905060016005600082825461133891906122bf565b9250508190555080426005543360405160200161135793929190611f8d565b6040516020818303038152906040528051906020012060001c61137a91906124e7565b91505090565b600080600090505b825181101561141e5760008382815181106113a6576113a56125d4565b5b6020026020010151905060005b8451811015611409578083141580156113e557508481815181106113da576113d96125d4565b5b602002602001015182145b156113f65760009350505050611424565b808061140190612446565b9150506113b3565b5050808061141690612446565b915050611388565b50600190505b919050565b6000806000600760003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020905060005b845181101561155e5760008582815181106114905761148f6125d4565b5b6020026020010151905060005b83600101805490508110156115495780831480156114da57508360010181815481106114cc576114cb6125d4565b5b906000526020600020015482145b156114f25784806114ea90612446565b955050611536565b8083141580156115215750836001018181548110611513576115126125d4565b5b906000526020600020015482145b1561153557858061153190612446565b9650505b5b808061154190612446565b91505061149d565b5050808061155690612446565b915050611472565b5050915091565b60606000600760003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020905060048160000160009054906101000a900460ff1660ff16111580156115cf5750600483145b15611644576040518060400160405280600981526020017f416c6c204465616421000000000000000000000000000000000000000000000081525091507f819b4d2d513904cf19fbe6a72ae78ae4887b651739debf1d083ab71a7a584d778260405161163b9190611fe5565b60405180910390a15b60048160000160009054906101000a900460ff1660ff1611801561167c575060088160000160009054906101000a900460ff1660ff16105b80156116885750600483145b156116fd576040518060400160405280600981526020017f416c6c204465616421000000000000000000000000000000000000000000000081525091507f819b4d2d513904cf19fbe6a72ae78ae4887b651739debf1d083ab71a7a584d77826040516116f49190611fe5565b60405180910390a15b60068160000160009054906101000a900460ff1660ff16148015611722575060048314155b15611797576040518060400160405280600d81526020017f3220747269616c73206c6566740000000000000000000000000000000000000081525091507fa52cac5f157d10d7a83ee566ef1576b43ae8e203f332b50b861ca430e030d2638260405161178e9190611fe5565b60405180910390a15b60078160000160009054906101000a900460ff1660ff161480156117bc575060048314155b15611831576040518060400160405280600b81526020017f46696e616c20747269616c00000000000000000000000000000000000000000081525091507fa52cac5f157d10d7a83ee566ef1576b43ae8e203f332b50b861ca430e030d263826040516118289190611fe5565b60405180910390a15b60088160000160009054906101000a900460ff1660ff16148015611856575060048314155b15611894576040518060400160405280600881526020017f596f75204c6f737400000000000000000000000000000000000000000000000081525091505b50919050565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff16141561190a576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401611901906120e7565b60405180910390fd5b61191682600083611a71565b60008060008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205490508181101561199c576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161199390612027565b60405180910390fd5b8181036000808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000208190555081600260008282546119f39190612315565b92505081905550600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef84604051611a5891906121a7565b60405180910390a3611a6c83600084611a76565b505050565b505050565b505050565b828054828255906000526020600020908101928215611ab7579160200282015b82811115611ab6578251825591602001919060010190611a9b565b5b509050611ac49190611ac8565b5090565b5b80821115611ae1576000816000905550600101611ac9565b5090565b6000611af8611af384612277565b612252565b90508083825260208201905082856020860282011115611b1b57611b1a612637565b5b60005b85811015611b4b5781611b318882611b98565b845260208401935060208301925050600181019050611b1e565b5050509392505050565b600081359050611b64816129a9565b92915050565b600082601f830112611b7f57611b7e612632565b5b8135611b8f848260208601611ae5565b91505092915050565b600081359050611ba7816129c0565b92915050565b600060208284031215611bc357611bc2612641565b5b6000611bd184828501611b55565b91505092915050565b60008060408385031215611bf157611bf0612641565b5b6000611bff85828601611b55565b9250506020611c1085828601611b55565b9150509250929050565b600080600060608486031215611c3357611c32612641565b5b6000611c4186828701611b55565b9350506020611c5286828701611b55565b9250506040611c6386828701611b98565b9150509250925092565b60008060408385031215611c8457611c83612641565b5b6000611c9285828601611b55565b9250506020611ca385828601611b98565b9150509250929050565b600060208284031215611cc357611cc2612641565b5b600082013567ffffffffffffffff811115611ce157611ce061263c565b5b611ced84828501611b6a565b91505092915050565b600060208284031215611d0c57611d0b612641565b5b6000611d1a84828501611b98565b91505092915050565b611d34611d2f82612349565b6124b9565b82525050565b611d438161235b565b82525050565b6000611d54826122a3565b611d5e81856122ae565b9350611d6e8185602086016123b0565b611d7781612646565b840191505092915050565b6000611d8f6023836122ae565b9150611d9a82612664565b604082019050919050565b6000611db26022836122ae565b9150611dbd826126b3565b604082019050919050565b6000611dd56022836122ae565b9150611de082612702565b604082019050919050565b6000611df8601d836122ae565b9150611e0382612751565b602082019050919050565b6000611e1b6026836122ae565b9150611e268261277a565b604082019050919050565b6000611e3e600f836122ae565b9150611e49826127c9565b602082019050919050565b6000611e616016836122ae565b9150611e6c826127f2565b602082019050919050565b6000611e846021836122ae565b9150611e8f8261281b565b604082019050919050565b6000611ea76025836122ae565b9150611eb28261286a565b604082019050919050565b6000611eca6024836122ae565b9150611ed5826128b9565b604082019050919050565b6000611eed6010836122ae565b9150611ef882612908565b602082019050919050565b6000611f106025836122ae565b9150611f1b82612931565b604082019050919050565b6000611f33601f836122ae565b9150611f3e82612980565b602082019050919050565b611f5281612387565b82525050565b611f69611f6482612387565b6124dd565b82525050565b611f788161239e565b82525050565b611f8781612391565b82525050565b6000611f998286611f58565b602082019150611fa98285611f58565b602082019150611fb98284611d23565b601482019150819050949350505050565b6000602082019050611fdf6000830184611d3a565b92915050565b60006020820190508181036000830152611fff8184611d49565b905092915050565b6000602082019050818103600083015261202081611d82565b9050919050565b6000602082019050818103600083015261204081611da5565b9050919050565b6000602082019050818103600083015261206081611dc8565b9050919050565b6000602082019050818103600083015261208081611deb565b9050919050565b600060208201905081810360008301526120a081611e0e565b9050919050565b600060208201905081810360008301526120c081611e31565b9050919050565b600060208201905081810360008301526120e081611e54565b9050919050565b6000602082019050818103600083015261210081611e77565b9050919050565b6000602082019050818103600083015261212081611e9a565b9050919050565b6000602082019050818103600083015261214081611ebd565b9050919050565b6000602082019050818103600083015261216081611ee0565b9050919050565b6000602082019050818103600083015261218081611f03565b9050919050565b600060208201905081810360008301526121a081611f26565b9050919050565b60006020820190506121bc6000830184611f49565b92915050565b60006060820190506121d76000830186611f49565b6121e46020830185611f49565b81810360408301526121f68184611d49565b9050949350505050565b60006020820190506122156000830184611f7e565b92915050565b60006060820190506122306000830186611f6f565b61223d6020830185611f49565b61224a6040830184611f49565b949350505050565b600061225c61226d565b90506122688282612415565b919050565b6000604051905090565b600067ffffffffffffffff82111561229257612291612603565b5b602082029050602081019050919050565b600081519050919050565b600082825260208201905092915050565b60006122ca82612387565b91506122d583612387565b9250827fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0382111561230a57612309612518565b5b828201905092915050565b600061232082612387565b915061232b83612387565b92508282101561233e5761233d612518565b5b828203905092915050565b600061235482612367565b9050919050565b60008115159050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b600060ff82169050919050565b60006123a982612391565b9050919050565b60005b838110156123ce5780820151818401526020810190506123b3565b838111156123dd576000848401525b50505050565b600060028204905060018216806123fb57607f821691505b6020821081141561240f5761240e612576565b5b50919050565b61241e82612646565b810181811067ffffffffffffffff8211171561243d5761243c612603565b5b80604052505050565b600061245182612387565b91507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff82141561248457612483612518565b5b600182019050919050565b600061249a82612391565b915060ff8214156124ae576124ad612518565b5b600182019050919050565b60006124c4826124cb565b9050919050565b60006124d682612657565b9050919050565b6000819050919050565b60006124f282612387565b91506124fd83612387565b92508261250d5761250c612547565b5b828206905092915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601260045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052603160045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052603260045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b600080fd5b600080fd5b600080fd5b600080fd5b6000601f19601f8301169050919050565b60008160601b9050919050565b7f45524332303a207472616e7366657220746f20746865207a65726f206164647260008201527f6573730000000000000000000000000000000000000000000000000000000000602082015250565b7f45524332303a206275726e20616d6f756e7420657863656564732062616c616e60008201527f6365000000000000000000000000000000000000000000000000000000000000602082015250565b7f45524332303a20617070726f766520746f20746865207a65726f20616464726560008201527f7373000000000000000000000000000000000000000000000000000000000000602082015250565b7f45524332303a20696e73756666696369656e7420616c6c6f77616e6365000000600082015250565b7f45524332303a207472616e7366657220616d6f756e742065786365656473206260008201527f616c616e63650000000000000000000000000000000000000000000000000000602082015250565b7f456e7465722034206e756d626572730000000000000000000000000000000000600082015250565b7f4e756d62657273206d75737420626520756e6971756500000000000000000000600082015250565b7f45524332303a206275726e2066726f6d20746865207a65726f2061646472657360008201527f7300000000000000000000000000000000000000000000000000000000000000602082015250565b7f45524332303a207472616e736665722066726f6d20746865207a65726f20616460008201527f6472657373000000000000000000000000000000000000000000000000000000602082015250565b7f45524332303a20617070726f76652066726f6d20746865207a65726f2061646460008201527f7265737300000000000000000000000000000000000000000000000000000000602082015250565b7f596f75204c6f737420616c726561647900000000000000000000000000000000600082015250565b7f45524332303a2064656372656173656420616c6c6f77616e63652062656c6f7760008201527f207a65726f000000000000000000000000000000000000000000000000000000602082015250565b7f45524332303a206d696e7420746f20746865207a65726f206164647265737300600082015250565b6129b281612349565b81146129bd57600080fd5b50565b6129c981612387565b81146129d457600080fd5b5056fea26469706673582212207e2398a07df545a17327d61da0b20a6311d160955f52338f62a0c46c607c1faa64736f6c63430008070033";

export class DOW__factory extends ContractFactory {
  constructor(
    ...args: [signer: Signer] | ConstructorParameters<typeof ContractFactory>
  ) {
    if (args.length === 1) {
      super(_abi, _bytecode, args[0]);
    } else {
      super(...args);
    }
  }

  deploy(
    overrides?: Overrides & { from?: string | Promise<string> }
  ): Promise<DOW> {
    return super.deploy(overrides || {}) as Promise<DOW>;
  }
  getDeployTransaction(
    overrides?: Overrides & { from?: string | Promise<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(overrides || {});
  }
  attach(address: string): DOW {
    return super.attach(address) as DOW;
  }
  connect(signer: Signer): DOW__factory {
    return super.connect(signer) as DOW__factory;
  }
  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): DOWInterface {
    return new utils.Interface(_abi) as DOWInterface;
  }
  static connect(address: string, signerOrProvider: Signer | Provider): DOW {
    return new Contract(address, _abi, signerOrProvider) as DOW;
  }
}