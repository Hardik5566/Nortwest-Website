<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orientation_QR.aspx.cs" Inherits="Orintation_Orientation_QR" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Orientation - Secure QR Code</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        :root {
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --primary: #c62828;
            --border-color: #e2e8f0;
            --success-bg: #f0fdf4;
            --success-text: #16a34a;
            --warn-text: #c2410c;
        }

        * { box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #33897C;
            color: var(--text-main);
            margin: 0;
            padding: 24px 16px;
            min-height: 100vh;
        }

        .wrap {
            width: 100%;
            max-width: 520px;
            margin: 0 auto;
        }

        .card {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 32px 24px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.06);
            border: 1px solid var(--border-color);
            text-align: center;
        }

        .brand-icon {
            font-size: 2.8rem;
            color: var(--primary);
            margin-bottom: 12px;
        }

        h1 {
            font-size: 1.45rem;
            font-weight: 700;
            margin: 0 0 20px;
        }

        .qr-box {
            background: #fff;
            padding: 20px;
            border-radius: 18px;
            display: inline-block;
            margin-bottom: 16px;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 16px rgba(15, 23, 42, 0.06);
        }

        .qr-image {
            width: 280px;
            height: 280px;
            display: block;
            margin: 0 auto;
        }

        .status-badge {
            background: var(--success-bg);
            color: var(--success-text);
            padding: 8px 14px;
            border-radius: 999px;
            font-size: 0.82rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 16px;
        }

        .actions {
            margin-bottom: 24px;
        }

        .btn-copy {
            border: 1px solid var(--border-color);
            border-radius: 10px;
            padding: 11px 22px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            background: #fff;
            color: var(--text-main);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-copy:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        .copy-hint {
            font-size: 0.8rem;
            color: var(--text-muted);
            margin: 8px 0 0;
        }

        .instructions {
            text-align: left;
            background: #f8fafc;
            border: 1px solid var(--border-color);
            border-left: 4px solid var(--primary);
            border-radius: 12px;
            padding: 16px;
            font-size: 0.9rem;
            line-height: 1.65;
            color: #334155;
        }

        .instructions p {
            margin: 0 0 10px;
        }

        .instructions ul {
            margin: 8px 0 0;
            padding-left: 18px;
        }

        .instructions li {
            margin-bottom: 4px;
        }

        .valid-until {
            margin-top: 10px;
            margin-bottom: 0;
            font-size: 0.85rem;
            color: var(--warn-text);
            font-weight: 600;
        }

        @media (min-width: 768px) {
            body { padding: 40px 20px; }
            .card { padding: 40px 32px; }
            h1 { font-size: 1.65rem; }
            .qr-image {
                width: 320px;
                height: 320px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnAccessUrl" runat="server" />

        <div class="wrap">
            <div class="card">
                <div class="brand-icon"><img src="../assets/img/nortwest.jpg" /></div>
                <h1>Student Orientation QR</h1>

                <div class="qr-box">
                    <asp:Image ID="imgQrCode" runat="server" CssClass="qr-image" />
                </div>

                <div class="status-badge">
                    <i class="fa-solid fa-circle-check"></i> Today's QR is active
                </div>

                <div class="actions">
                    <button type="button" class="btn-copy" onclick="copyAccessLink(); return false;">
                        <i class="fa-regular fa-copy"></i> Copy link
                    </button>
                    <p class="copy-hint">Copies the full secure link to your clipboard.</p>
                </div>

                <div class="instructions">
                    <p><strong>Instructions</strong></p>
                    <ul>
                        <li>Students scan the QR code above to open today's orientation page.</li>
                        <li>Complete all steps in order from Step 1 to Step 5.</li>
                        <li>Keep passport, visa, and supporting documents ready.</li>
                        <li>Use <strong>Copy link</strong> to share today's secure link by email or message.</li>
                    </ul>
                    <p class="valid-until">Valid until: <asp:Literal ID="litExpiresAt" runat="server" /></p>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function copyAccessLink() {
            var el = document.getElementById('<%= hdnAccessUrl.ClientID %>');
            var text = el ? (el.value || '').trim() : '';
            if (!text) {
                alert('Link is not available. Please refresh the page.');
                return;
            }

            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(text).then(function () {
                    alert('Link copied! You can paste it in email, WhatsApp, or SMS.');
                }).catch(function () {
                    fallbackCopy(text);
                });
                return;
            }

            fallbackCopy(text);
        }

        function fallbackCopy(text) {
            var temp = document.createElement('textarea');
            temp.value = text;
            temp.setAttribute('readonly', '');
            temp.style.position = 'absolute';
            temp.style.left = '-9999px';
            document.body.appendChild(temp);
            temp.select();
            document.execCommand('copy');
            document.body.removeChild(temp);
            alert('Link copied! You can paste it in email, WhatsApp, or SMS.');
        }
    </script>
</body>
</html>
