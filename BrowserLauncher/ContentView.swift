import SwiftUI

struct ContentView: View {
    let client = Client()
    @State var isPerformingTask: Bool = false

    var body: some View {
        HStack {
            Spacer()
            Button("Launch Browser") {
                Task {
                    self.isPerformingTask = true
                    let url = URL(string: "https://www.apple.com/")!
                    await client.launch(url: url)
                    self.isPerformingTask = false
                }
            }
            .disabled(isPerformingTask)
            Spacer()
        }
        .frame(minWidth: 250, minHeight: 75)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
