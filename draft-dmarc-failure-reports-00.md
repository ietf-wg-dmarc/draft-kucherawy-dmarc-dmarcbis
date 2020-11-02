Internet-Draft

DMARC Failure reports

October 2020

Jones & Vesely

Expires April 29, 2021

\[Page\]

<div id="external-metadata" class="document-information">

</div>

<div id="internal-metadata" class="document-information">

  - Workgroup:  
    DMARC

  - Internet-Draft:  
    draft-dmarc-failure-reports-00

  - Published:  
    October 26, 2020

  - Intended Status:  
    Standards Track

  - Expires:  
    April 29, 2021

  - Authors:
    
    <div class="author">
    
    <div class="author-name">
    
    S. M. Jones, <span class="editor">Ed.</span>
    
    </div>
    
    </div>
    
    <div class="author">
    
    <div class="author-name">
    
    A. Vesely,
<span class="editor">Ed.</span>
    
    </div>
    
    </div>

</div>

# Domain-based Message Authentication, Reporting, and Conformance (DMARC) Failure Reporting

<div id="section-abstract" class="section">

## [Abstract](#abstract)

Domain-based Message Authentication, Reporting, and Conformance (DMARC)
is a scalable mechanism by which a mail-originating organization can
express domain-level policies and preferences for message validation,
disposition, and reporting, that a mail-receiving organization can use
to improve mail handling.[¶](#section-abstract-1)

This document descripes Failure Reporting, one of the two kinds of
reporting that DMARC provides.[¶](#section-abstract-2)

</div>

<div id="status-of-memo">

<div id="section-boilerplate.1" class="section">

## [Status of This Memo](#name-status-of-this-memo)

This Internet-Draft is submitted in full conformance with the provisions
of BCP 78 and BCP 79.[¶](#section-boilerplate.1-1)

Internet-Drafts are working documents of the Internet Engineering Task
Force (IETF). Note that other groups may also distribute working
documents as Internet-Drafts. The list of current Internet-Drafts is at
<span><https://datatracker.ietf.org/drafts/current/></span>.[¶](#section-boilerplate.1-2)

Internet-Drafts are draft documents valid for a maximum of six months
and may be updated, replaced, or obsoleted by other documents at any
time. It is inappropriate to use Internet-Drafts as reference material
or to cite them other than as "work in
progress."[¶](#section-boilerplate.1-3)

This Internet-Draft will expire on April 29,
2021.[¶](#section-boilerplate.1-4)

</div>

</div>

<div id="copyright">

<div id="section-boilerplate.2" class="section">

## [Copyright Notice](#name-copyright-notice)

Copyright (c) 2020 IETF Trust and the persons identified as the document
authors. All rights reserved.[¶](#section-boilerplate.2-1)

This document is subject to BCP 78 and the IETF Trust's Legal Provisions
Relating to IETF Documents
(<span><https://trustee.ietf.org/license-info></span>) in effect on the
date of publication of this document. Please review these documents
carefully, as they describe your rights and restrictions with respect to
this document. Code Components extracted from this document must include
Simplified BSD License text as described in Section 4.e of the Trust
Legal Provisions and are provided without warranty as described in the
Simplified BSD License.[¶](#section-boilerplate.2-2)

</div>

</div>

<div id="toc">

<div id="section-toc.1" class="section">

[▲](#)

## [Table of Contents](#name-table-of-contents)

  - 
    
    <div id="section-toc.1-1.1">
    
    [1](#section-1).  [Failure
    Reports](#name-failure-reports)[¶](#section-toc.1-1.1.1)
    
      - 
        
        <div id="section-toc.1-1.1.2.1">
        
        [1.1](#section-1.1).  [Reporting Format
        Update](#name-reporting-format-update)[¶](#section-toc.1-1.1.2.1.1)
        
        </div>
    
    </div>

  - 
    
    <div id="section-toc.1-1.2">
    
    [2](#section-2).  [References](#name-references)[¶](#section-toc.1-1.2.1)
    
      - 
        
        <div id="section-toc.1-1.2.2.1">
        
        [2.1](#section-2.1).  [Normative
        References](#name-normative-references)[¶](#section-toc.1-1.2.2.1.1)
        
        </div>
    
      - 
        
        <div id="section-toc.1-1.2.2.2">
        
        [2.2](#section-2.2).  [Informative
        References](#name-informative-references)[¶](#section-toc.1-1.2.2.2.1)
        
        </div>
    
    </div>

  - 
    
    <div id="section-toc.1-1.3">
    
    [Appendix A](#section-appendix.a).  [Per-Message Failure Reports
    Directed to Third
    Party](#name-per-message-failure-reports)[¶](#section-toc.1-1.3.1)
    
    </div>

  - 
    
    <div id="section-toc.1-1.4">
    
    [](#section-appendix.b)[Authors'
    Addresses](#name-authors-addresses)[¶](#section-toc.1-1.4.1)
    
    </div>

</div>

</div>

<div id="section-1" class="section">

## [1.](#section-1)[Failure Reports](#name-failure-reports)

Failure reports are normally generated and sent almost immediately after
the Mail Receiver detects a DMARC failure. Rather than waiting for an
aggregate report, these reports are useful for quickly notifying the
Domain Owners when there is an authentication failure. Whether the
failure is due to an infrastructure problem or the message is
inauthentic, failure reports also provide more information about the
failed message than is available in an aggregate
report.[¶](#section-1-1)

These reports SHOULD include any URI(s) from the message that failed
authentication. These reports SHOULD include as much of the message and
message header as is reasonable to support the Domain Owner's
investigation into what caused the message to fail authentication and
track down the sender.[¶](#section-1-2)

When a Domain Owner requests failure reports for the purpose of forensic
analysis, and the Mail Receiver is willing to provide such reports, the
Mail Receiver generates and sends a message using the format described
in <span>\[[RFC6591](#RFC6591)\]</span>; this document updates that
reporting format, as described in [Section
1.1](#sect-7.3.1).[¶](#section-1-3)

The destination(s) and nature of the reports are defined by the "ruf"
and "fo" tags as defined in **TBD**.[¶](#section-1-4)

Where multiple URIs are selected to receive failure reports, the report
generator MUST make an attempt to deliver to each of
them.[¶](#section-1-5)

An obvious consideration is the denial-of-service attack that can be
perpetrated by an attacker who sends numerous messages purporting to be
from the intended victim Domain Owner but that fail both SPF and DKIM;
this would cause participating Mail Receivers to send failure reports to
the Domain Owner or its delegate in potentially huge volumes.
Accordingly, participating Mail Receivers are encouraged to aggregate
these reports as much as is practical, using the Incidents field of the
Abuse Reporting Format (<span>\[[RFC5965](#RFC5965)\]</span>). Various
aggregation techniques are possible, including the
following:[¶](#section-1-6)

  - <span id="section-1-7.1">only send a report to the first recipient
    of multi-recipient messages;[¶](#section-1-7.1)</span>
  - <span id="section-1-7.2">store reports for a period of time before
    sending them, allowing detection, collection, and reporting of like
    incidents;[¶](#section-1-7.2)</span>
  - <span id="section-1-7.3">apply rate limiting, such as a maximum
    number of reports per minute that will be generated (and the
    remainder
discarded).[¶](#section-1-7.3)</span>

<div id="sect-7.3.1">

<div id="section-1.1" class="section">

### [1.1.](#section-1.1)[Reporting Format Update](#name-reporting-format-update)

Operators implementing this specification also implement an augmented
version of <span>\[[RFC6591](#RFC6591)\]</span> as
follows:[¶](#section-1.1-1)

1.  
    
    <div id="section-1.1-2.1">
    
    A DMARC failure report includes the following ARF header fields,
    with the indicated normative requirement
    levels:[¶](#section-1.1-2.1.1)
    
      - <span id="section-1.1-2.1.2.1">Identity-Alignment (REQUIRED;
        defined below)[¶](#section-1.1-2.1.2.1)</span>
      - <span id="section-1.1-2.1.2.2">Delivery-Result
        (OPTIONAL)[¶](#section-1.1-2.1.2.2)</span>
      - <span id="section-1.1-2.1.2.3">DKIM-Domain, DKIM-Identity,
        DKIM-Selector (REQUIRED if the message was signed by
        DKIM)[¶](#section-1.1-2.1.2.3)</span>
      - <span id="section-1.1-2.1.2.4">DKIM-Canonicalized-Header,
        DKIM-Canonicalized-Body (OPTIONAL if the message was signed by
        DKIM)[¶](#section-1.1-2.1.2.4)</span>
      - <span id="section-1.1-2.1.2.5">SPF-DNS
        (REQUIRED)[¶](#section-1.1-2.1.2.5)</span>
    
    </div>

2.  <span id="section-1.1-2.2">The "Identity-Alignment" field is defined
    to contain a comma- separated list of authentication mechanism names
    that produced an aligned identity, or the keyword "none" if none
    did. ABNF:[¶](#section-1.1-2.2)</span>

<div id="section-1.1-3">

``` sourcecode lang-abnf
  id-align     = "Identity-Alignment:" [CFWS]
                 ( "none" /
                 dmarc-method *( [CFWS] "," [CFWS] dmarc-method ) )
                 [CFWS]

  dmarc-method = ( "dkim" / "spf" )
  ; each may appear at most once in an id-align
```

[¶](#section-1.1-3)

</div>

1.  <span id="section-1.1-4.1">Authentication Failure Type "dmarc" is
    defined, which is to be used when a failure report is generated
    because some or all of the authentication mechanisms failed to
    produce aligned identifiers. Note that a failure report generator
    MAY also independently produce an AFRF message for any or all of the
    underlying authentication
methods.[¶](#section-1.1-4.1)</span>

</div>

</div>

</div>

<div id="section-2" class="section">

## [2.](#section-2)[References](#name-references)

<div id="section-2.1" class="section">

### [2.1.](#section-2.1)[Normative References](#name-normative-references)

  - \[RFC6591\]  
    <span class="refAuthor">Fontana, H.</span>,
    <span class="refTitle">"Authentication Failure Reporting Using the
    Abuse Reporting Format"</span>, <span class="seriesInfo">RFC
    6591</span>, <span class="seriesInfo">DOI 10.17487/RFC6591</span>,
    April 2012,
    <span>\<<https://www.rfc-editor.org/info/rfc6591>\></span>.

</div>

<div id="section-2.2" class="section">

### [2.2.](#section-2.2)[Informative References](#name-informative-references)

  - \[RFC5965\]  
    <span class="refAuthor">Shafranovich,
    Y.</span><span class="refAuthor">, Levine,
    J.</span><span class="refAuthor">, and M. Kucherawy</span>,
    <span class="refTitle">"An Extensible Format for Email Feedback
    Reports"</span>, <span class="seriesInfo">RFC 5965</span>,
    <span class="seriesInfo">DOI 10.17487/RFC5965</span>, August 2010,
    <span>\<<https://www.rfc-editor.org/info/rfc5965>\></span>.

</div>

</div>

<div id="sect-b.2.3">

<div id="section-appendix.a" class="section">

## [Appendix A.](#section-appendix.a)[Per-Message Failure Reports Directed to Third Party](#name-per-message-failure-reports)

The Domain Owner from the previous example is maintaining the same
policy but now wishes to have a third party receive and process the
per-message failure reports. Again, not all Receivers will honor this
request, but those that do may implement additional checks to validate
that the third party wishes to receive the failure reports for this
domain.[¶](#section-appendix.a-1)

The Domain Owner needs to alter its policy record from Appendix B.2.2 as
follows:[¶](#section-appendix.a-2)

  - <span id="section-appendix.a-3.1">Per-message failure reports should
    be sent via email to the address
    "auth-reports@thirdparty.example.net"
    ("ruf=mailto:auth-reports@thirdparty.example.net")[¶](#section-appendix.a-3.1)</span>

The DMARC policy record might look like this when retrieved using a
common command-line tool (the output shown would appear on a single line
but is wrapped here for publication):[¶](#section-appendix.a-4)

<div id="section-appendix.a-5">

``` sourcecode
  % dig +short TXT _dmarc.example.com.
  "v=DMARC1; p=none; rua=mailto:dmarc-feedback@example.com;
  ruf=mailto:auth-reports@thirdparty.example.net"
```

[¶](#section-appendix.a-5)

</div>

To publish such a record, the DNS administrator for the Domain Owner
might create an entry like the following in the appropriate zone file
(following the conventional zone file format):[¶](#section-appendix.a-6)

<div id="section-appendix.a-7">

``` sourcecode
  ; DMARC record for the domain example.com

  _dmarc IN TXT ( "v=DMARC1; p=none; "
                  "rua=mailto:dmarc-feedback@example.com; "
                  "ruf=mailto:auth-reports@thirdparty.example.net" )
```

[¶](#section-appendix.a-7)

</div>

Because the address used in the "ruf" tag is outside the Organizational
Domain in which this record is published, conforming Receivers will
implement additional checks as described in Section 7.1 of this
document. In order to pass these additional checks, the third party will
need to publish an additional DNS record as
follows:[¶](#section-appendix.a-8)

  - <span id="section-appendix.a-9.1">Given the DMARC record published
    by the Domain Owner at "\_dmarc.example.com", the DNS administrator
    for the third party will need to publish a TXT resource record at
    "example.com.\_report.\_dmarc.thirdparty.example.net" with the value
    "v=DMARC1;".[¶](#section-appendix.a-9.1)</span>

The resulting DNS record might look like this when retrieved using a
common command-line tool (the output shown would appear on a single line
but is wrapped here for publication):[¶](#section-appendix.a-10)

<div id="section-appendix.a-11">

``` sourcecode
  % dig +short TXT example.com._report._dmarc.thirdparty.example.net
  "v=DMARC1;"
```

[¶](#section-appendix.a-11)

</div>

To publish such a record, the DNS administrator for example.net might
create an entry like the following in the appropriate zone file
(following the conventional zone file
format):[¶](#section-appendix.a-12)

<div id="section-appendix.a-13">

``` sourcecode
  ; zone file for thirdparty.example.net
  ; Accept DMARC failure reports on behalf of example.com

  example.com._report._dmarc   IN   TXT    "v=DMARC1;"
```

[¶](#section-appendix.a-13)

</div>

Intermediaries and other third parties should refer to **TBD** for the
full details of this mechanism.[¶](#section-appendix.a-14)

</div>

</div>

<div id="authors-addresses">

<div id="section-appendix.b" class="section">

## [Authors' Addresses](#name-authors-addresses)

<div class="left" dir="auto">

<span class="fn nameRole">Steven M Jones
(<span class="role">editor</span>)</span>

</div>

<div class="email">

<span>Email:</span> <smj@crash.com>

</div>

<div class="left" dir="auto">

<span class="fn nameRole">Alessandro Vesely
(<span class="role">editor</span>)</span>

</div>

<div class="email">

<span>Email:</span> <vesely@tana.it>

</div>

</div>

</div>
