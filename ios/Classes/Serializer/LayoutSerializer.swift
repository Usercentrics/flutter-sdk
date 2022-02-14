import UsercentricsUI

extension UsercentricsLayout {
    static func initialize(from value: Any?) -> UsercentricsLayout? {
        let valueString = value as! String
        switch valueString {
        case "SHEET":
            return .sheet
        case "FULL":
            return .full
        case "POPUP_CENTER":
            return .popup(position: .center)
        case "POPUP_BOTTOM":
            return .popup(position: .bottom)
        default:
            assert(false)
            return nil
        }
    }
}
