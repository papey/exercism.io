export const isPangram = (input) => {
    const lowered = input.toLowerCase()
    return 'abcdefghijklmnopqrstuvwxyz'.split('').every((letter) => lowered.includes(letter))
}
