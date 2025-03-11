from fpdf import FPDF

class ReportPDF(FPDF):
    def header(self):
        self.set_font('Arial', 'B', 16)
        self.cell(0, 10, 'Weekly Threat Report', ln=True, align='C')

    def body(self, threat_data):
        self.set_font('Arial', '', 12)
        for entry in threat_data:
            self.cell(0, 10, f"{entry['type']} - IP: {entry['ip']} - Time: {entry['timestamp']}", ln=True)

    def footer(self):
        self.set_y(-15)
        self.set_font('Arial', 'I', 8)
        self.cell(0, 10, 'Generated by Cybersecurity Monitoring System', align='C')

def generate_pdf(threat_data):
    pdf = ReportPDF()
    pdf.add_page()
    pdf.body(threat_data)
    pdf.output('reports/weekly_report.pdf')
