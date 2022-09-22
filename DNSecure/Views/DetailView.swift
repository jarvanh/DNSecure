//
//  DetailView.swift
//  DNSecure
//
//  Created by Kenta Kubo on 9/25/20.
//

import SwiftUI

struct DetailView {
    @Binding var server: Resolver
    @Binding var isOn: Bool

    private func binding(for rule: OnDemandRule) -> Binding<OnDemandRule> {
        guard let index = self.server.onDemandRules.firstIndex(of: rule) else {
            preconditionFailure("Can't find rule in array")
        }
        return self.$server.onDemandRules[index]
    }
}

extension DetailView: View {
    var body: some View {
        Form {
            Section {
                Toggle("Use This Server", isOn: self.$isOn)
            }
            Section {
                HStack {
                    Text("Name")
                    TextField("Name", text: self.$server.name)
                        .multilineTextAlignment(.trailing)
                }
            }
            self.serverConfigurationSections
            Section {
                ForEach(self.server.onDemandRules) { rule in
                    NavigationLink(
                        rule.name,
                        destination: RuleView(rule: self.binding(for: rule))
                    )
                }
                .onDelete { self.server.onDemandRules.remove(atOffsets: $0) }
                .onMove { self.server.onDemandRules.move(fromOffsets: $0, toOffset: $1) }
                Button("Add New Rule") {
                    self.server.onDemandRules
                        .append(OnDemandRule(name: "New Rule"))
                }
            } header: {
                EditButton()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .overlay(alignment: .leading) {
                        Text("On Demand Rules")
                    }
            }
        }
        .navigationTitle(self.server.name)
    }

    @ViewBuilder private var serverConfigurationSections: some View {
        switch self.server.configuration {
        case .dnsOverTLS(let configuration):
            DoTSections(server: self.$server, configuration: configuration)
        case .dnsOverHTTPS(let configuration):
            DoHSections(server: self.$server, configuration: configuration)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            server: .constant(
                .init(
                    name: "My Server",
                    configuration: .dnsOverTLS(DoTConfiguration())
                )
            ),
            isOn: .constant(true)
        )
    }
}
