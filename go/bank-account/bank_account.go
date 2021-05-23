package account

import (
	"sync"
)

// Account structure
type Account struct {
	sync.RWMutex
	balance int64
	open    bool
}

// Open a new account
func Open(initialDeposit int64) *Account {
	if initialDeposit < 0 {
		return nil
	}

	return &Account{
		balance: initialDeposit,
		open:    true,
	}
}

// Close an account
func (a *Account) Close() (int64, bool) {
	a.Lock()
	defer a.Unlock()

	if !a.open {
		return 0, false
	}

	a.open = false
	return a.balance, true
}

// Deposit balance on the account
func (a *Account) Deposit(amount int64) (int64, bool) {
	a.Lock()
	defer a.Unlock()

	if !a.open {
		return a.balance, false
	}

	if amount < 0 && amount*-1 > a.balance {
		return a.balance, false
	}

	a.balance += amount

	return a.balance, true
}

// Balance get the balance of an account
func (a *Account) Balance() (int64, bool) {
	a.RLock()
	defer a.RUnlock()

	if !a.open {
		return 0, false
	}

	return a.balance, true
}
