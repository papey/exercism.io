local BankAccount = {}

function BankAccount:new()
    local account = {amount = 0, open = true}
    return setmetatable(account, { __index = self })
end

function BankAccount:balance()
    return self.amount
end

function BankAccount:deposit(value)
    assert(self.open, "Error: deposit not allowed on closed accounts")
    assert(value > 0, "Error: deposit value is not positive")
    self.amount = self.amount + value
end

function BankAccount:withdraw(value)
    assert(self.open, "Error: withdraw not allowed on closed accounts")
    assert(value > 0, "Error: withdraw value is not positive")
    assert(self.amount > value)
    self.amount = self.amount - value
end

function BankAccount:close()
    self.open = false
end

return BankAccount
